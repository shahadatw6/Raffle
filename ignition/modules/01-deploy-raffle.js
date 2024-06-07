const { network, ethers } = require("hardhat");

module.exports = async function ({ getNamedAccounts, deployments }) {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  const raffle = await deploy("Raffle", {
    from: deployer,
    args: arguments,
    log: true,
    waitConfirmations: waitBlockConfirmations || 1,
  });
};
