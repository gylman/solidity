// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    // State variables
    uint public number;
    string public text;

    // Event declarations
    event NumberChanged(uint newNumber);
    event TextChanged(string newText);

    // Function modifier
    modifier onlyPositive(uint _number) {
        require(_number > 0, "Number must be positive");
        _;
    }

    // Constructor to initialize state variables
    constructor(uint _number, string memory _text) {
        number = _number;
        text = _text;
    }

    // Function to set the number
    function setNumber(uint _number) public onlyPositive(_number) {
        number = _number;
        emit NumberChanged(_number);
    }

    // Function to set the text
    function setText(string memory _text) public {
        text = _text;
        emit TextChanged(_text);
    }
}
