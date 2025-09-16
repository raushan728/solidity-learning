// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Keccak {
    function hash(address a, uint b) external pure returns(bytes32) { return keccak256(abi.encodePacked(a,b)); }

    function idFor(address a, uint nonce) external view returns (bytes32) { return keccak256(abi.encodePacked(block.chainid, a, nonce)); }
}
