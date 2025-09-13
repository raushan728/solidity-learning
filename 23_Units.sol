// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Units {
    uint public oneEther = 1 ether;
    uint public oneGwei = 1 gwei;
    uint public tenSeconds = 10 seconds;

    function priceInWei(uint eth) external pure returns (uint) { return eth * 1 ether; }
}
