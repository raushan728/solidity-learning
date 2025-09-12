// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Payable {
    address payable public owner = payable(msg.sender);
    mapping(address=>uint) public balance;

    receive() external payable { balance[msg.sender] += msg.value; }

    function deposit() external payable { balance[msg.sender] += msg.value; }

    function withdraw(uint amount) external { 
        require(balance[msg.sender] >= amount, "insufficient");
        balance[msg.sender] -= amount;
        (bool ok,) = payable(msg.sender).call{value: amount}("");
        require(ok, "send fail");
    }

    function ownerWithdrawAll() external { require(msg.sender==owner); owner.transfer(address(this).balance); }
}
