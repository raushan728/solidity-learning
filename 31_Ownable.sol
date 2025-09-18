// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Ownable {
    address public owner;
    event OwnershipTransferred(address indexed from, address indexed to);
    constructor() { owner = msg.sender; }
    modifier onlyOwner() { require(msg.sender==owner, "not owner"); _; }
    function transferOwnership(address n) external onlyOwner { require(n!=address(0)); emit OwnershipTransferred(owner, n); owner = n; }
}
