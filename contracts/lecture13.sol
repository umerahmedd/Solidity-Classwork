// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract lecture13 {

    uint public a;
    uint public b;
    event inc(address wallet, uint _a, string message);

    constructor(uint _b){
        b = _b;
    }

    // receive() external payable { 
    //    increment();
    // } 

    function increment() public {
        a++;
        emit inc(msg.sender, a, "done");
    }

    // 4 Types of Modifiers
    // 1. Public -> All
    // 2. Private -> Current contract
    // 3. External -> Except current contract
    // 4. Internal -> Current and inherited


}

