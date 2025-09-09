// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
error NotOwner();
error ValueTooSmall(uint have, uint want);

contract Errors {
    address public owner = msg.sender;

    modifier onlyOwner() { if (msg.sender != owner) revert NotOwner(); _; }

    function onlyOwnerAction() external onlyOwner { /* ok */ }

    function safeDivide(uint a, uint b) external pure returns(uint) { 
        require(b != 0, "b zero"); 
        uint c = a / b;
        assert(c <= a); 
        return c;
    }

    function checkMin(uint v) external pure { if (v < 10) revert ValueTooSmall(v, 10); }
}
