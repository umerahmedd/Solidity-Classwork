// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract lecture12{

    mapping (address => uint) balances;
    mapping (address => uint) counter;
    uint count;
    address owner = msg.sender;
    uint public contractBalance;

    modifier onlyOwner(){
        require(msg.sender == owner, "Not an owner");
        _;
    }

    function addBalance() payable public {

        contractBalance = address(this).balance; //solidity adds contract's balance automatically

        require(msg.value >= 2 ether, "Value should be greater than 2 ethers");
        require(contractBalance <= 10 ether, "Limit reached");

        balances[msg.sender] = msg.value;
        counter[msg.sender] = count++;
            
    }

    function getCounter(address add) public view onlyOwner returns (uint) {
        return counter[add];
    }
}