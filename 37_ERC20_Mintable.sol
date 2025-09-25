// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./36_ERC20_Min.sol";

contract ERC20Mintable is ERC20Min {
    address public owner = msg.sender;
    uint public cap;

    constructor(uint _cap) { cap = _cap; }

    function mint(address to, uint value) external { 
        require(msg.sender==owner, "not owner");
        require(totalSupply + value <= cap, "cap");
        totalSupply += value;
        balanceOf[to] += value;
        emit Transfer(address(0), to, value);
    }

    function burn(uint value) external { require(balanceOf[msg.sender] >= value); balanceOf[msg.sender] -= value; totalSupply -= value; emit Transfer(msg.sender, address(0), value); }
}
