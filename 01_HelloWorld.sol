// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/// Simple contract with greetings and owner-only update.
contract HelloWorld {
    string public greeting;
    address public owner;

    event GreetingChanged(string oldGreeting, string newGreeting);

    constructor(string memory _greeting) { 
        greeting = _greeting;
        owner = msg.sender;
    }

    function sayHello() external view returns (string memory) { return greeting; }

    function setGreeting(string calldata _g) external { 
        require(msg.sender == owner, "only owner");
        string memory old = greeting;
        greeting = _g;
        emit GreetingChanged(old, _g);
    }

    // helper: read length of greeting
    function greetingLength() external view returns (uint) { return bytes(greeting).length; }
}
