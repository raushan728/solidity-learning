// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Logic { uint public x; function setX(uint v) external { x = v; } }

contract Proxy {
    uint public x;
    function run(address logic, uint v) external {
        (bool ok,) = logic.delegatecall(abi.encodeWithSignature("setX(uint256)", v));
        require(ok, "delegate failed");
    }
}
