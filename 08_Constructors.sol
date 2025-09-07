// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Constructors {
    string public title;
    address public owner;
    event Deployed(address indexed owner, string title);

    constructor(string memory _title) { title = _title; owner = msg.sender; emit Deployed(owner, _title); }

    function setTitle(string calldata _t) external { require(msg.sender==owner, "only owner"); title = _t; }
}
