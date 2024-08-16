import { HardhatUserConfig, vars } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";

const MNEMONIC = vars.get("MNEMONIC");

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
      url: "https://enugu-rpc.assetchain.org",
      chainId: 42421,
      accounts: {
        mnemonic: MNEMONIC,
      },
      from: "0xF6f2D0A9F55C61240427A6AA9dE62419EC8539f8",
    },
    // hardhat: {},
    // sepolia: {},
    // mumbai: {},
  },
};

export default config;
