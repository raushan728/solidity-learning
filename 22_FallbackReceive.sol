// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract FallbackReceive {
    event Log(string func, uint value, bytes data);

    fallback() external payable { emit Log("fallback", msg.value, msg.data); }
    receive() external payable { emit Log("receive", msg.value, ""); }

    function sendTo(address payable to) external payable { (bool ok,) = to.call{value: msg.value}(""); require(ok); }
}
