const parkingProvider = artifacts.require("parkingProvider");

module.exports = function (deployer) {
  deployer.deploy(parkingProvider);
};