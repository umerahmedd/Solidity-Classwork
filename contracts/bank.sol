// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract bank{

    mapping (address => uint) balances;
    
    uint public contractBalance;


    function deposit() public payable  {

        balances[msg.sender] = msg.value;
    }

    function transfer( address to)  public payable  {

        require(msg.value <= balances[msg.sender], "Low Balance");
        balances[msg.sender] -= msg.value;
        balances[to] += msg.value;
    }
}