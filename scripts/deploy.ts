import { formatEther, parseEther } from "viem";
import hre from "hardhat";

async function main() {
  const initialSupply = parseEther("50000000");
  const realix = await hre.viem.deployContract("Realix", [initialSupply]);
  console.log(
    `
    Realix Token successfully deployed!
    Contract Address: ${realix.address}
    Initial Supply: ${new Intl.NumberFormat().format(Number(formatEther(initialSupply)))} RLX
    `
  );

  const marketplace = await hre.viem.deployContract("Marketplace");
  console.log(
    `
    Marketplace Contract successfully deployed!
    Contract Address: ${marketplace.address}
    `
  );

  const vendorFactory = await hre.viem.deployContract("VendorFactory");
  console.log(
    `
    VendorFactory Contract successfully deployed!
    Contract Address: ${vendorFactory.address}
    `
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
