// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Arrays {
    uint[] public nums;
    uint[3] public fixedNums;
    mapping(address=>uint[]) public perUser;

    function push(uint x) external { nums.push(x); perUser[msg.sender].push(x); }
    function pop() external { nums.pop(); }
    function getNums() external view returns (uint[] memory) { return nums; }

    function find(uint value) external view returns (int) { 
        for (uint i=0; i<nums.length; i++) if (nums[i] == value) return int(i);
        return -1;
    }
}
