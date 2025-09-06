// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Modifiers {
    address public owner;
    mapping(address => bool) public admins;
    constructor() { owner = msg.sender; admins[owner] = true; }

    modifier onlyOwner() { require(msg.sender == owner, "not owner"); _; }

    modifier onlyAdmin() { require(admins[msg.sender], "not admin"); _; }

    function setAdmin(address who, bool ok) external onlyOwner { admins[who] = ok; }

    function privilegedAction() external onlyAdmin { /* do protected task */ }

    function transferOwnership(address newOwner) external onlyOwner { owner = newOwner; }
}
