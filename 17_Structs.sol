// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Structs {
    struct User { string name; uint age; bool active; }
    mapping(address => User) public users;
    address[] public addresses;

    function register(string calldata n, uint a) external { 
        if (bytes(users[msg.sender].name).length == 0) addresses.push(msg.sender);
        users[msg.sender] = User(n, a, true);
    }

    function deactivate(address who) external { users[who].active = false; }

    function listAddresses() external view returns (address[] memory) { return addresses; }
}
