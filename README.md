# Token Vendor

## Description

An app that lets users purchase your ERC20 token, transfer it, and sell it back to the vendor

## Installation and Setup Instructions

### Prerequisites

- Node (v18 LTS)
- Yarn (v1 or v2+)
- Git

### Clone the Repository

To get started, clone the repository to your local machine:

```bash
git clone https://github.com/dianakocsis/token-vendor
```

### Environment Setup

1. Navigate to the cloned directory:

   ```bash
   cd token-vendor
   ```

2. Copy the .env.example files to create a new .env file and fill in the necessary details:

   ```bash
   cp .env.example .env
   ```

   ```bash
   cd frontend
   cp .env.example .env
   ```

### Environment Setup

1. Install Dependencies

   To install project dependencies, run the following commands:

   ```bash
   yarn install
   cd frontend && yarn install
   cd ..
   ```

2. Start Local Blockchain

   In a new terminal, start the local blockchain:

   ```bash
   yarn chain
   ```

3. Deploy Contracts (In another tab)

   Open another terminal tab and deploy the contracts:

   ```bash
   yarn deploy
   ```

4. Start the Aplication (In another tab)

   Finally, in a new terminal tab, start the application:

   ```bash
   yarn start
   ```

## Testnet Deploy Information

| Contract  | Address Etherscan Link                                                            |
| --------- | --------------------------------------------------------------------------------- |
| YourToken | `https://sepolia.etherscan.io/address/0xd7257Dc312a20de02343A6322655103aF2D093d5` |
| Vendor    | `https://sepolia.etherscan.io/address/0xe94fdc7D103B3Dd7b6A152b5a455855BE41262F2` |
