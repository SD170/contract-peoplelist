const Migrations = artifacts.require("Migrations");
const People = artifacts.require("../contracts/People.sol");
module.exports = function (deployer) {
  deployer.deploy(People);
};
