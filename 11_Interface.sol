// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface ICounter { function get() external view returns(uint); function inc() external; }

contract Counter is ICounter {
    uint private c;
    event Incremented(address indexed by, uint newVal);
    function get() external view returns(uint) { return c; }
    function inc() external { c += 1; emit Incremented(msg.sender, c); }
}
