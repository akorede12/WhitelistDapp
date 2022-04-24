//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract whitelist {
    // max number of whitelisted addresses allowed 
    uint8 public maxWhiteListedAddresses;

    // create a mapping of WhitelistedAddresses 
    // if an address is whitelisted, we would set it to true, it is false by default 
    // for all other addresses 
    mapping(address => bool) public whitelistedAddresses;

    // keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted; 

    // set the max number of whitelisted addresses 
    // user puts the value at time of deployment 
    constructor(uint8 _maxWhitelistedAddresses ) {
        maxWhiteListedAddresses = _maxWhitelistedAddresses;
    }
    
    // add Address of sender to the whitelist 
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted 
        require(!whitelistedAddresses[msg.sender], "sender has already been whitelisted");
        // check if num of whitelisted address is less than maxWhiteListedAddresses, if so throw an error
        require(numAddressesWhitelisted < maxWhiteListedAddresses, "More addresses cant be added, limit reached");
        // add the address that called the function to the whitelistedAddresses mapping 
        whitelistedAddresses[msg.sender] = true; 
        // increase the number of whitelisted addresses 
        numAddressesWhitelisted += 1; 
    }
}