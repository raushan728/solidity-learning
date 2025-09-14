// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Overloading {
    function sum(uint a, uint b) public pure returns(uint) { return a+b; }
    function sum(uint a, uint b, uint c) public pure returns(uint) { return a+b+c; }
    function sum(int a, int b) public pure returns(int) { return a+b; }
}
