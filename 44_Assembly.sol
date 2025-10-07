// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract AssemblyDemo {
    function add2(uint a, uint b) external pure returns (uint r) { assembly { r := add(a, b) } }

    function revertWithCode(uint code) external pure { assembly { mstore(0x00, code) revert(0x00, 0x20) } }
}
