// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ERC721Min {
    string public name = "NFT";
    string public symbol = "NFT";
    mapping(uint=>address) public ownerOf;
    mapping(address=>uint) public balanceOf;
    mapping(uint=>string) public tokenURI;
    event Transfer(address indexed from, address indexed to, uint indexed tokenId);

    function mint(address to, uint tokenId, string calldata uri) external { 
        require(ownerOf[tokenId] == address(0), "exists");
        ownerOf[tokenId] = to; balanceOf[to] += 1; tokenURI[tokenId] = uri;
        emit Transfer(address(0), to, tokenId);
    }

    function transfer(address to, uint tokenId) external { 
        address owner = ownerOf[tokenId];
        require(msg.sender == owner, "not owner");
        ownerOf[tokenId] = to;
        unchecked { balanceOf[msg.sender] -= 1; balanceOf[to] += 1; }
        emit Transfer(msg.sender, to, tokenId);
    }
}
