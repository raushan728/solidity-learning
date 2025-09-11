// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Mapping {
    mapping(address => uint) public balance;
    mapping(address => mapping(address => uint)) public allowance;

    function set(uint amount) external { balance[msg.sender] = amount; }
    function increment(uint amount) external { balance[msg.sender] += amount; }

    function approve(address spender, uint amount) external { allowance[msg.sender][spender] = amount; }
    function transferFrom(address from, address to, uint amount) external { 
        require(allowance[from][msg.sender] >= amount, "not allowed");
        require(balance[from] >= amount, "low balance");
        allowance[from][msg.sender] -= amount;
        balance[from] -= amount;
        balance[to] += amount;
    }
}
