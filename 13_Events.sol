// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Events {
    event Deposited(address indexed from, uint amount, uint balance);
    mapping(address=>uint) public balance;

    function deposit() external payable { 
        balance[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value, balance[msg.sender]);
    }

    function withdraw(uint amount) external { 
        require(balance[msg.sender] >= amount, "low");
        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
