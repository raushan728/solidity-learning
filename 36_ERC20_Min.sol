// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ERC20Min {
    string public name = "Token";
    string public symbol = "TKN";
    uint8 public decimals = 18;
    uint public totalSupply;
    mapping(address=>uint) public balanceOf;
    mapping(address=>mapping(address=>uint)) public allowance;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    function _transfer(address from, address to, uint value) internal { 
        require(balanceOf[from] >= value, "bal");
        unchecked { balanceOf[from] -= value; balanceOf[to] += value; }
        emit Transfer(from,to,value);
    }

    function transfer(address to, uint value) external returns(bool) { _transfer(msg.sender,to,value); return true; }

    function approve(address spender, uint value) external returns(bool) { allowance[msg.sender][spender] = value; emit Approval(msg.sender, spender, value); return true; }

    function transferFrom(address from, address to, uint value) external returns(bool) { 
        require(allowance[from][msg.sender] >= value, "allow");
        allowance[from][msg.sender] -= value;
        _transfer(from, to, value);
        return true;
    }
}
