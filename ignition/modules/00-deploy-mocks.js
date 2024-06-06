const { network, ethers } = require("hardhat");
const { developmentChains } = require("../../helper-hardhat-config");

module.exports = async function ({ getNamedAccounts, deployments }) {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = network.config.chainId;

  const raffle = await deploy("Raffle", {
    from: deployer,
    args: arguments,
    log: true,
      waitConfirmations: network.config.waitBlockConfirmations || 1,
    console.log("ksdegf");
  });
};
