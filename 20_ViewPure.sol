// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ViewPure {
    uint public base = 3;
    function tripleView(uint x) external view returns(uint) { return base * x; }
    function triplePure(uint x) external pure returns(uint) { return 3 * x; }

    function computeNoState(uint a, uint b) external pure returns (uint) { return a*a + b*b; }
}
