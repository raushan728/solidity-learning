// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
library MathLib {
    function max(uint a, uint b) internal pure returns(uint) { return a > b ? a : b; }
    function min(uint a, uint b) internal pure returns(uint) { return a < b ? a : b; }
    function avg(uint a, uint b) internal pure returns(uint) { return (a + b) / 2; }
}

contract UseLib {
    using MathLib for uint;
    function bigger(uint a, uint b) external pure returns(uint) { return MathLib.max(a,b); }
    function average(uint a, uint b) external pure returns(uint) { return MathLib.avg(a,b); }
}
