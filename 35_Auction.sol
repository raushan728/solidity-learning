// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Auction {
    address public highestBidder;
    uint public highestBid;
    mapping(address=>uint) public refunds;
    address public owner;

    constructor() { owner = msg.sender; }

    function bid() external payable { 
        require(msg.value > highestBid, "low");
        if (highestBidder != address(0)) refunds[highestBidder] += highestBid;
        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function withdrawRefund() external { 
        uint amt = refunds[msg.sender]; 
        require(amt > 0, "no funds"); 
        refunds[msg.sender] = 0; 
        (bool ok,) = payable(msg.sender).call{value: amt}(""); require(ok);
    }

    function finalize() external { require(msg.sender == owner); payable(owner).transfer(highestBid); }
}
