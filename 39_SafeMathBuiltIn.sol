// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract SafeMathBuiltIn {
    function add(uint a, uint b) external pure returns(uint) { return a + b; }
    function checkedAdd(uint a, uint b) external pure returns(uint) { unchecked { return a + b; } } // no overflow checks
}
