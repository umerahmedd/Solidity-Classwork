// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ownable {

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newOwner) public onlyOwner{
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }

    function loop() public pure returns(uint){
        uint count = 0;

        for (uint i=0; i<10; i++) 
        {
            if (i == 8){
                continue; // skips all code below and goes back up
                //break;  // exits loop g
            }
            count = count + 2;
        }
        return count;
    }
}
