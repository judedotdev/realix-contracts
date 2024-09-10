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
   - VendorFactory: `0x5E9d19cd67e5f66848a940681bAe2aC9DDe882a1`
   - Vendor: `0x34Ec81E70e0CE648758D25Ff7bE3C18816017B87`
   - Realix: `0xE8b60c36c45AD67BaBaa757edbE065e6659d2452`
