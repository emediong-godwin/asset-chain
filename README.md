# AssetChain - Real World Asset Tokenization Platform

**AssetChain** is a Clarity smart contract deployed on the [Stacks blockchain](https://www.stacks.co/), designed to enable the secure and compliant tokenization of real-world assets (RWAs). With native support for asset registration, fractional ownership, dividend distribution, and decentralized governance, AssetChain bridges the gap between traditional assets and Bitcoin-backed decentralized finance (DeFi).

## Key Features

- **Bitcoin-Secured Asset Tokenization**  
  Tokenize real-world assets into fungible tokens (SFTs) with full ownership tracking and on-chain records, leveraging Stacks' Bitcoin-secured consensus.

- **Fractional Ownership**  
  Split assets into `100,000` fungible tokens per asset, allowing for shared ownership and improved liquidity.

- **Regulatory Compliance**  
  Built-in KYC level management and expiry validation ensure compliance with global regulatory standards.

- **Dividend Distribution**  
  Enable periodic dividend claims based on token holdings, ensuring fair and transparent asset revenue sharing.

- **Governance System**  
  Decentralized proposal and voting mechanism allowing stakeholders to participate in key decisions.

- **Price Oracles**  
  Integration with trusted oracle providers to track up-to-date valuation of assets on-chain.

## Contract Overview

### Constants

- **`tokens-per-asset`**: Each asset is divided into 100,000 fractional tokens.
- **KYC / Expiry / Duration Limits**: Controlled via constants like `MAX-KYC-LEVEL`, `MAX-EXPIRY`, etc.

### Storage

- **Assets**: Metadata, value, creation block, total dividends.
- **Token Balances**: Track ownership per principal and asset ID.
- **KYC Status**: Approval status, level, and expiry.
- **Proposals & Votes**: Voting-based governance for each asset.
- **Dividends**: Historical claim tracking.
- **Price Feeds**: Oracle-provided asset valuation.

## 🔧 Core Public Functions

### `register-asset (metadata-uri, asset-value)`

Register a new tokenized asset. Only the contract owner can call this. Asset is initialized with full token ownership.

### `claim-dividends (asset-id)`

Claim pending dividends based on token ownership. Automatically updates last claimed amount.

### `create-proposal (asset-id, title, duration, minimum-votes)`

Create a governance proposal for a given asset. Requires the sender to hold at least 10% of the asset's tokens.

### `vote (proposal-id, vote-for, amount)`

Vote for or against a proposal using held tokens. Votes are weighted and stored to prevent duplicates.

## Read-only Functions

- `get-asset-info(asset-id)`: Returns asset metadata and status.
- `get-balance(owner, asset-id)`: Token balance for a user and asset.
- `get-proposal(proposal-id)`: Governance proposal details.
- `get-vote(proposal-id, voter)`: Vote details per user.
- `get-price-feed(asset-id)`: Oracle price data.
- `get-last-claim(asset-id, claimer)`: Dividend claim history.

## Validation & Access Control

- **Owner-only operations** like asset registration are strictly enforced.
- **KYC enforcement** ensures only approved users can interact meaningfully.
- **Proposal durations and thresholds** are constrained to prevent abuse.
- All data is rigorously validated for integrity and compliance.

## Example Use Case

1. **Asset Owner** registers a real estate property worth $500K using `register-asset`.
2. Tokens are distributed to investors representing fractional ownership.
3. Rental income is distributed via `claim-dividends`.
4. A stakeholder creates a governance proposal to increase asset rent.
5. Token holders vote using `vote`, influencing the platform’s direction.

## Deployment Notes

- Compatible with Stacks 2.1+ and Clarity smart contracts.
- Requires integration with off-chain systems for:
  - Price oracle feeds
  - KYC onboarding and verification
  - Dividend funding and payout mechanisms

## Development & Testing

To test and deploy:

```bash
clarinet check       # Validate contract syntax
clarinet deployment      # Deploy to a local or testnet environment
```
