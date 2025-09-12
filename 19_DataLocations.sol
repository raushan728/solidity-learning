// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract DataLocations {
    string public title = "default";

    function setTitleMemory(string memory t) external { title = t; }

    function concatCalldata(string calldata a, string calldata b) external pure returns (string memory) { 
        return string(abi.encodePacked(a, " ", b));
    }

    function modifyStorageExample() external { 
        string storage s = title; // read pointer to storage
        // cannot assign to storage local of string directly with calldata
    }
}
