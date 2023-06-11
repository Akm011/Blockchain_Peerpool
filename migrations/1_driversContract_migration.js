const driversContract = artifacts.require("driversContract");

module.exports = function (deployer) {
  deployer.deploy(driversContract);
};