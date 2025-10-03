// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract LowLevelCall {
    function raw(address to, bytes calldata data, uint value) external payable returns (bool, bytes memory) {
        (bool success, bytes memory ret) = to.call{value: value}(data);
        return (success, ret);
    }
}
