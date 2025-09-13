// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./25_Library.sol";

contract ImportDemo {
    function pick(uint a, uint b) external pure returns(uint) { return MathLib.max(a,b); }
}
