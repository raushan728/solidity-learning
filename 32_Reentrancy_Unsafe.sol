// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/// Educational vulnerable vault (do not deploy in production).
contract VaultUnsafe {
    mapping(address=>uint) public bal;
    function deposit() external payable { bal[msg.sender] += msg.value; }
    function withdraw() external { 
        uint amount = bal[msg.sender];
        require(amount>0, "no bal");
        // vulnerable: external call before state update
        (bool ok,) = msg.sender.call{value: amount}("");
        require(ok, "send failed");
        bal[msg.sender] = 0;
    }
}
