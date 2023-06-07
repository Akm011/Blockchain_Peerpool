const Transaction = artifacts.require("Transactions");

module.exports = function (deployer) {
  deployer.deploy(Transaction);
};