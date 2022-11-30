// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.7;

import "./SimpleStorage.sol"; 


// factory design pattern
// every time you click createSimpleStorageArray a new SimpleStorage gets created and adds to simpleStorageArray
// you can then choose that simpleStorage from that simpleStorageArray and its favourite number by calling sfStore
// you can then get the simpleStorage stored at that array and retreive the favourite number stored.

contract StorageFactory {
    
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    

    // set to factory object that we created
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI 
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    // get from simpleStorageArray
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}