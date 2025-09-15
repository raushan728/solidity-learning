// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Pausable {
    bool public paused;
    address public owner;
    constructor() { owner = msg.sender; }

    modifier whenNotPaused() { require(!paused, "paused"); _; }
    modifier onlyOwner() { require(msg.sender==owner, "owner"); _; }

    function setPaused(bool p) external onlyOwner { paused = p; }

    function doWork() external whenNotPaused returns (string memory) { return "worked"; }
}
