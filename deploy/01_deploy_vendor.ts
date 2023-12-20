import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

const deployVendor: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  // Deploy Vendor
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;
  const yourToken = await hre.ethers.getContract("YourToken", deployer);
  await deploy("Vendor", {
    from: deployer,
    // Contract constructor arguments
    args: [yourToken.address],
    log: true,
    autoMine: true,
  });
  const vendor = await hre.ethers.getContract("Vendor", deployer);

  // Transfer tokens to Vendor
  await yourToken.transfer(vendor.address, hre.ethers.utils.parseEther("1000"));

  // // Transfer contract ownership to your frontend address
  await vendor.transferOwnership("0x80584B69e51DAE0D0b03BE93EBc014FAAB6D15dF");
};

export default deployVendor;

deployVendor.tags = ["Vendor"];
