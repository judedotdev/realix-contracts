# Realix Contracts

Smart contracts for Realix, a platform that tokenizes real-world assets.

This repository contains the core Solidity contracts, deployment scripts, and tests for managing and interacting with tokenized assets on the blockchain.

## Installation

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts
SOLIDITY_COVERAGE=true npx hardhat coverage
npx hardhat verify --network <network-name> <address>
npx hardhat verify --network assetChainTestnet <RealixAddress> "initialSupply"
npx hardhat verify --network assetChainTestnet CONTRACT_ADDRESS "ARG1" "ARG2" "ARG3"
```

## Deployment addresses

### Testnets

1) AssetChain Testnet
   - Marketplace: `0x8de25645104C3151ad9A8cDF6bC651301d9Ab48F`
   - VendorFactory: `0xeF3A94d28467f66A7A18fE321fc75B8F70dDbd5a`
   - Vendor: `0x2cbbb05720bc1b368dcb9aed07b38bd209f9f496`
   - Realix: `0xE8b60c36c45AD67BaBaa757edbE065e6659d2452`
