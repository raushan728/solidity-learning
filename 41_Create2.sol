// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Child { address public creator; constructor() { creator = msg.sender; } }
contract Factory {
    event Deployed(address addr, bytes32 salt);

    function deploy(bytes32 salt) external returns(address addr) {
        addr = address(new Child{salt: salt}());
        emit Deployed(addr, salt);
    }

    function predict(bytes32 salt, bytes memory bytecode) public view returns (address) {
        bytes32 hash = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(bytecode)));
        return address(uint160(uint(hash)));
    }
}
