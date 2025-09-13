// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Gas {
    uint public total;
    event Steps(uint gasBefore, uint gasAfter);

    function loop(uint n) external { 
        uint g0 = gasleft();
        for (uint i=0; i<n; i++) { total += i; }
        uint g1 = gasleft();
        emit Steps(g0, g1);
    }
}
