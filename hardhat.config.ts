import { HardhatUserConfig, vars } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";
import "@typechain/hardhat";
import "@nomicfoundation/hardhat-verify";

const MNEMONIC = vars.get("MNEMONIC");
const PRIVATE_KEY = vars.get("PRIVATE_KEY");
const ETHERSCAN_API_KEY = vars.get("ETHERSCAN_API_KEY");
const accounts = {
  mnemonic: MNEMONIC ||
    'syrup test test test test test test test test test test test',
};

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.26",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      }
    }
  },
  networks: {
    assetChainTestnet: {
      chainId: 42421,
      url: "https://enugu-rpc.assetchain.org",
      accounts: [PRIVATE_KEY],
      from: "0xF6f2D0A9F55C61240427A6AA9dE62419EC8539f8",
      gas: "auto",
      gasPrice: "auto",
      // gasMultiplier: 1.2, // Adjust if needed
    },

    // hardhat: {},
    // sepolia: {},
    // mumbai: {},
  },
  typechain: {
    outDir: 'typechain',
    target: 'ethers-v6',
  },
  etherscan: {
    apiKey: {
      assetChainTestnet: ETHERSCAN_API_KEY,
    },
    customChains: [
      {
        network: "assetChainTestnet",
        chainId: 42421,
        urls: {
          apiURL: "https://scan-testnet.assetchain.org/api",
          browserURL: "https://scan-testnet.assetchain.org/",
        }
      }
    ],
  },
  sourcify: {
    enabled: false,
  }
};

export default config;
