// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Practice {

    address public owner;
    uint[5] public arr = [1,2,3,4,5];
    uint[5] public arr2;
    uint[] public dynamicArr = [10,299,3244,454,43,43,1];

    enum Status {
        pending, 
        shipped,
        accepted,
        rejected,
        canceled 
    }

    Status status;

    struct Emp{
        string name;
        uint age;
        address acc;
    }

    Emp public emp;
    Emp[] public emps;

    constructor(){
        owner = msg.sender;
        arr2 = [10,20,30,40,50];

        emp.name = "Test";
        emp.age = 20;
        emp.acc = owner;
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

    // Fixed sized array

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

    // Dynamic Array

    function dynamicArray() public{
        
        // //get
        // uint temp = dynamicArr[3];

        // //update
        // dynamicArr[4] = 222;

        // //delete
        // delete dynamicArr[1];

        // //length
        // uint len = dynamicArr.length;

        //push
        dynamicArr.push(99);

        //pop
        dynamicArr.pop;

    }

    //Enums

    function getStatus() public view returns (Status) {
        return status;
    }

    function setStatus(Status _status) public {
        status = _status;
    }

    function reject() public {
        status = Status.rejected;
    }

    function reset() public {
        delete status;
    }

    //Struct

    function setValues() public {
        
        //1st way of initializing
        Emp memory emp1 = Emp("Umer",21, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

        //2nd way of initializing
        Emp memory emp2 = Emp({acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age:22, name: "Ahmed"});

        //3rd way of initializing
        Emp memory emp3;
        emp3.name = "John";
        emp3.age = 23;
        emp3.acc = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

        emps.push(emp1);
        emps.push(emp2);
        emps.push(emp3);

        emps.push(Emp("Doe",30,msg.sender));

        Emp storage emp_temp = emp; //Storage is used to store data permanently on the blockchain. Memory is used to store temporary data that is needed during the execution of a function.
        emp_temp.name = "James";

        Emp storage emp_temp2 = emps[1];
        emp_temp2.age = 31;

    }
}
