// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Enums {
    enum Status { None, Pending, Active, Closed, Cancelled }
    Status public status;

    modifier onlyIn(Status s) { require(status == s, "bad state"); _; }

    function start() external { require(status == Status.None); status = Status.Pending; }
    function activate() external onlyIn(Status.Pending) { status = Status.Active; }
    function close() external onlyIn(Status.Active) { status = Status.Closed; }
    function cancel() external { status = Status.Cancelled; }
}
