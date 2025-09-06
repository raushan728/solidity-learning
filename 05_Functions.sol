// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/// View, Pure, internal, external examples plus return multiple values.
contract Functions {
    uint public a = 5;

    function add(uint b) external view returns (uint) { return a + b; }

    function mul(uint x, uint y) external pure returns (uint) { return x * y; }

    function swap(uint x, uint y) external pure returns (uint, uint) { return (y, x); }

    function _internalDouble(uint x) internal pure returns (uint) { return 2 * x; }

    function double(uint x) external pure returns (uint) { return _internalDouble(x); }
}
