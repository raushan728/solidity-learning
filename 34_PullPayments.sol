// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract PullPayments {
    mapping(address=>uint) public pending;
    event PaymentQueued(address indexed to, uint amount);

    function asyncSend(address to) external payable { pending[to] += msg.value; emit PaymentQueued(to, msg.value); }

    function withdraw() external { 
        uint amount = pending[msg.sender];
        require(amount > 0, "none");
        pending[msg.sender] = 0;
        (bool ok,) = msg.sender.call{value: amount}(""); 
        require(ok, "fail");
    }
}
