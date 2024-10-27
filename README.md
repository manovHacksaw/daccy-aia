--

# Daccy - Elevate Your DSA Skills with AI and Web3.0 By Earning AIA 💻✨

**Learn, Debug, and Succeed** with AI-powered assistance.

Daccy is an AI-powered learning web application designed to help users master Data Structures and Algorithms (DSA) through real-time debugging support, personalized learning paths, and AI-generated challenges.

## Features

- **AI-Based DSA Challenges**: Problems generated based on user-selected difficulty levels with intentional bugs for learning.
- **AI Chatbot**: Get answers to DSA-related questions using Gemini AI.
- **Generative Learning**: Automatically generated content on DSA topics like arrays, linked lists, and more.
- **Web3.0 Integration**: Engage with coding challenges on the blockchain by investing AIA and earning rewards.

## Earn AIA with Coding Challenges

Participants can join coding challenges by investing **AIA**, and upon solving a challenge correctly, they earn a reward greater than their initial investment. The AIA reward amount varies according to the difficulty level of the challenge. Rewards for successful participants are funded by the AIA locked from participants who do not solve the challenge.

- **Challenge Contract Address**: [0x183315cf20F7d6133a48Bfd251BE2D0734EDAE02](https://testnet.aiascan.com/address/0x183315cf20F7d6133a48Bfd251BE2D0734EDAE02)

## Challenges

We faced inconsistencies with the Gemini AI model's content generation. To overcome this:
- **Refined input prompts** for more accurate results.
- Implemented **quality control** by reviewing AI-generated content.
- Added a **user feedback system** for continuous improvement.

## Tech Stack

- **Frontend**: Next.js
- **Backend**: Node.js, Express.js
- **Database**: Prisma ORM
- **AI**: Gemini AI

## Getting Started

### Prerequisites

- Prisma
- PostgreSQL

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/manovHacksaw/daccy-aia
   ```
2. Navigate to the project directory:
   ```bash
   cd daccy-aia
   ```
3. Install dependencies:
   ```bash
   npm install
   ```

### Environment Variables

Create a `.env` file and add:

```env
GEMINI_API_KEY=
```

### Run the Project

Start the development server:
```bash
npm run dev
```

## Contributing

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Push and create a pull request.

## License

Licensed under the MIT License. See [LICENSE](LICENSE).

---
