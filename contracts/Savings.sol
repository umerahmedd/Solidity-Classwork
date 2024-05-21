// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract savings {

    
    uint amount;
    mapping (address => uint) balances;
    mapping (address => uint) lastDepositTime;
    event inc(address wallet, uint _amount, string message);

    function deposit() public payable {

        balances[msg.sender] = msg.value;
        lastDepositTime[msg.sender] = block.timestamp;
        emit inc(msg.sender, msg.value, "Amount deposited");
    }

    function withdraw() public payable   {

        require(lastDepositTime[msg.sender] > 1 minutes, "Cooldown period has not elapsed yet");
        amount = address(this).balance;
        payable(msg.sender).transfer(amount);
        emit inc(msg.sender, msg.value, "Amount withdrawn");
    }

    
}







// payment deposit 
// cannot withdraw until 1 month