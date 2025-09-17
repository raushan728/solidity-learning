// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ECDSADemo {
    function recover(bytes32 hash, bytes memory signature) public pure returns (address) {
        require(signature.length == 65, "bad sig");
        bytes32 r; bytes32 s; uint8 v;
        assembly { r := mload(add(signature, 32)) s := mload(add(signature, 64)) v := byte(0, mload(add(signature, 96))) }
        return ecrecover(hash, v, r, s);
    }

    function prefixed(bytes32 h) public pure returns (bytes32) { return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", h)); }
}
