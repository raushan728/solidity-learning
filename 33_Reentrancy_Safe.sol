// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract VaultSafe {
    mapping(address=>uint) public bal;
    bool private locked;
    modifier noReentrant() { require(!locked, "locked"); locked = true; _; locked = false; }

    function deposit() external payable { bal[msg.sender] += msg.value; }

    function withdraw() external noReentrant { 
        uint amount = bal[msg.sender];
        require(amount>0, "no bal");
        bal[msg.sender] = 0;
        (bool ok,) = msg.sender.call{value: amount}(""); 
        require(ok, "send failed");
    }
}
