// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/// Shows gas/byte savings with constants & immutables.
contract ConstantsImmutables {
    uint256 public constant VERSION = 42;
    address public immutable DEPLOYER;
    uint public createdAt;

    constructor() { DEPLOYER = msg.sender; createdAt = block.timestamp; }

    function info() external view returns (uint256, address, uint) { return (VERSION, DEPLOYER, createdAt); }
}
