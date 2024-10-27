// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract DaccyChallenge {
    address public owner;

    struct Challenge {
        uint256 entryFee;
        uint256 reward;
        uint256 difficulty; // 1 = Easy, 2 = Medium, 3 = Hard
        bool isActive;
        mapping(address => bool) participants;
        mapping(address => bool) solved;
        uint256 lockedAmount; // Total amount locked by unsuccessful participants
    }

    mapping(uint256 => Challenge) public challenges;
    uint256 public challengeCount;

    event ChallengeCreated(uint256 indexed challengeId, uint256 entryFee, uint256 reward, uint256 difficulty);
    event ChallengeParticipated(uint256 indexed challengeId, address participant);
    event ChallengeSolved(uint256 indexed challengeId, address solver, uint256 reward);
    event ChallengeFailed(uint256 indexed challengeId, address participant);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function createChallenge(uint256 _entryFee, uint256 _reward, uint256 _difficulty) external onlyOwner {
        require(_difficulty >= 1 && _difficulty <= 3, "Difficulty must be 1, 2, or 3");
        require(_reward > _entryFee, "Reward must be greater than entry fee");

        challengeCount++;
        Challenge storage challenge = challenges[challengeCount];
        challenge.entryFee = _entryFee;
        challenge.reward = _reward;
        challenge.difficulty = _difficulty;
        challenge.isActive = true;

        emit ChallengeCreated(challengeCount, _entryFee, _reward, _difficulty);
    }

    function participate(uint256 _challengeId) external payable {
        Challenge storage challenge = challenges[_challengeId];
        require(challenge.isActive, "Challenge is not active");
        require(msg.value == challenge.entryFee, "Incorrect entry fee");
        require(!challenge.participants[msg.sender], "Already participating");

        challenge.participants[msg.sender] = true;
        challenge.lockedAmount += msg.value;

        emit ChallengeParticipated(_challengeId, msg.sender);
    }

    function submitSolution(uint256 _challengeId, bool _isCorrect) external {
        Challenge storage challenge = challenges[_challengeId];
        require(challenge.participants[msg.sender], "Not a participant");

        if (_isCorrect) {
            require(challenge.lockedAmount >= challenge.reward, "Insufficient funds for reward");
            challenge.solved[msg.sender] = true;
            challenge.lockedAmount -= challenge.reward;
            payable(msg.sender).transfer(challenge.reward);

            emit ChallengeSolved(_challengeId, msg.sender, challenge.reward);
        } else {
            challenge.lockedAmount += challenge.entryFee;
            emit ChallengeFailed(_challengeId, msg.sender);
        }
    }

    function deactivateChallenge(uint256 _challengeId) external onlyOwner {
        challenges[_challengeId].isActive = false;
    }

    function withdrawLockedAmount() external onlyOwner {
        uint256 amount = address(this).balance;
        require(amount > 0, "No funds to withdraw");
        payable(owner).transfer(amount);
    }

    receive() external payable {}

    fallback() external payable {}
}
