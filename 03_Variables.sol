// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/// State vs local vs immutable vs constant usage patterns.
contract Variables {
    uint public x; // state
    address public immutable deployer;
    uint public constant LIMIT = 1000;

    constructor() { deployer = msg.sender; }

    function setX(uint _x) external { 
        uint temp = _x + 1; // local
        if (temp > LIMIT) revert("over limit");
        x = temp;
    }

    function resetIfOwner() external { if (msg.sender == deployer) x = 0; }
}
