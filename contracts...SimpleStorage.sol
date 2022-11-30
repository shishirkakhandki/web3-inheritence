// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

//  contract similar to class
contract SimpleStorage {

    // bool 
    // uint if uninitialized, 0
    // string
    // byte
    // address
    // int 
    // data types ^ 

    // without explicit type modifier, it is internal (current and children contract)
    // 1. type 2. visibility 3. variable name
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // People public person = People({
    //     2, "abc"
    // ); 

    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    // setter
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }
    

// view function only reads from blockchain, no modification of state
   // pure functions no modification, no reads, no need to spend gas as no writing on blockchain (modify state)
  
//    steps:
//    "function" keyword
//    function "name"
//    "brackets", add parameters if there are any return
//    "access modifier", "return type if returning something"
//    "curly braces"
    
    // getter
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    // more like a constructor
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
