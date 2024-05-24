// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ownable {

    address public owner;
    uint[5] public arr = [1,2,3,4,5];
    uint[5] public arr2;

    constructor(){
        owner = msg.sender;
        arr2 = [10,20,30,40,50];
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

    function array() public returns (uint){
        //get
        uint temp;
        temp = arr[3];

        //update
        arr[2] = 3000;

        //delete
        delete arr[4];

        //length
        uint len = arr.length;

        return len; 
    }

    function arrayWithLoop(uint _x) public {
        for (uint i = 0; i < arr2.length; i++) 
        {
            arr2[i] = _x+i;
        }
    }

    function createArray() public pure returns (uint) {
        uint[] memory arrMem = new uint[](3);
        arrMem[1] = 33;

        return arrMem[1];
    }

    function returnArray() public view returns (uint[5] memory) {
        return arr2;
    }

}
