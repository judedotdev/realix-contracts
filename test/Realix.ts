import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox-viem/network-helpers";
import { expect } from "chai";
import hre from "hardhat";
import { getAddress, parseGwei, formatEther, parseEther } from "viem";

describe("Realix", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployRealixToken() {
    const initialSupply = parseEther("50000000");

    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await hre.viem.getWalletClients();

    const realix = await hre.viem.deployContract("Realix", [initialSupply]);

    const publicClient = await hre.viem.getPublicClient();

    return {
      realix,
      initialSupply,
      owner,
      otherAccount,
      publicClient,
    };
  }

  describe("Deployment", function () {
    it("Should set the right name", async function () {
      const { realix } = await loadFixture(deployRealixToken);

      expect(await realix.read.name()).to.equal("Realix");
    });

    it("Should set the right symbol", async function () {
      const { realix } = await loadFixture(deployRealixToken);

      expect(await realix.read.symbol()).to.equal("RLX");
    });

    it("Should set the right decimals", async function () {
      const { realix } = await loadFixture(deployRealixToken);

      expect(await realix.read.decimals()).to.equal(18);
    });

    it("Should set the right totalSupply", async function () {
      const { realix, initialSupply } = await loadFixture(deployRealixToken);

      expect(await realix.read.totalSupply()).to.equal(initialSupply);
    });

    it("Should mint the totalSupply to the deployer address", async function () {
      const { realix, owner, initialSupply } = await loadFixture(deployRealixToken);
      const deployer = getAddress(owner.account.address);

      expect(await realix.read.totalSupply()).to.equal(await realix.read.balanceOf([deployer]));
      expect(await realix.read.balanceOf([deployer])).to.equal(initialSupply);
    });

  });
});
