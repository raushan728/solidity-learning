// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/// Demonstrates value & reference types with example functions.
contract DataTypes {
    bool public flag = true;
    int256 public signed = -123;
    uint256 public counter = 100;
    bytes1 public b1 = 0x12;
    bytes public payload = hex"deadbeef";
    address public owner = msg.sender;
    string public name = "Raushan";

    function toggleFlag() external { flag = !flag; }

    function increment(uint256 x) external returns (uint256) { counter += x; return counter; }

    // return first byte of payload or 0
    function firstByte() external view returns (bytes1) { return payload.length > 0 ? payload[0] : bytes1(0); }
}
