// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface IExt { function ping() external returns(bool); }

contract TryCatch {
    bool public ok;
    event GotOk(bool ok);

    function call(address a) external { 
        try IExt(a).ping() returns (bool r) { ok = r; emit GotOk(r); }
        catch Error(string memory reason) { ok = false; emit GotOk(false); }
        catch { ok = false; emit GotOk(false); }
    }
}
