// Right click on the script name and hit "Run" to execute
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Storage", function () {
   it("test updating and retrieving updated value", async function () {
    const Storage = await ethers.getContractFactory("Storage");
    const storage = await Storage.deploy();
    await storage.deployed();
    const storage2 = await ethers.getContractAt("Storage", storage.address);

    const setValue = await storage2.push("test");
    await setValue.wait();
    console.log(storage2.get());
    //expect((await storage2.retrieve()).to.equal(storage.address));
  });
});