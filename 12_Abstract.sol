// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
abstract contract Shape { function area() public view virtual returns(uint); }

contract Square is Shape {
    uint public side;
    constructor(uint _s) { side = _s; }
    function area() public view override returns(uint) { return side*side; }
}

contract Circle is Shape {
    uint public radius;
    constructor(uint r) { radius = r; }
    function area() public view override returns(uint) { return 31415 * radius * radius / 10000; }
}
