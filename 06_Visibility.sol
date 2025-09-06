// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Visibility {
    uint private secret = 7;
    uint internal base = 10;
    uint public exposed = 99;

    function _inside() private view returns (uint) { return secret; }

    function readBase() internal view returns (uint) { return base; }

    function readExposed() external view returns (uint) { return exposed; }
}

contract Child is Visibility {
    function readFromParent() external view returns (uint, uint) { return (_inside(), readBase()); }
}
