// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract X { function who() public pure virtual returns(string memory) { return "X"; } }
contract Y { function who() public pure virtual returns(string memory) { return "Y"; } }
contract Z is X, Y {
    function who() public pure override(X, Y) returns (string memory) { return "Z"; }
}
