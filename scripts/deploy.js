const { ethers } = require("hardhat");

async function main() {
    /*
    
    */
   const whitelistContract = await ethers.getContractFactory("whitelist");
    // deploy whitelist contract and set max whitelist to 10
   const deployedWhitelistContract = await whitelistContract.deploy(10);

   // print address of the  deployed contract 
   console.log(
       "Whitelist Contract Address",
       deployedWhitelistContract.address 
   );
}

// call the main contract and catch if there was an error 
main()
 .then(() => process.exit(0))
 .catch((error) => {
     console.error(error);
     process.exit(1);
 });