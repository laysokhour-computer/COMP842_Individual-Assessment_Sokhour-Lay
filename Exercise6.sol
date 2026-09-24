// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// COMP842 Exercise 6 - Sokhour Lay (25314544)
// Based on the HelloWorld contract from the Week 8 tutorial (Part D: Modifying
// Smart Contract Data). The message variable and setMessage function are
// unchanged from the tutorial. The studentId variable, the owner variable, the
// constructor and the onlyOwner modifier were added for this exercise.

contract Exercise6 {
    string public message = "Hello COMP842";   // from the Week 8 tutorial
    string public studentId;                   // the extra variable added for this exercise
    address public owner;                      // the account that deployed the contract

    constructor() {
        owner = msg.sender;                    // whoever deploys becomes the owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can update the student ID");
        _;
    }

    // unchanged from the tutorial: anyone may update the message
    function setMessage(string memory newMessage) public {
        message = newMessage;
    }

    // added for this exercise: only the owner may set the student ID
    function setStudentId(string memory newStudentId) public onlyOwner {
        studentId = newStudentId;
    }
}
