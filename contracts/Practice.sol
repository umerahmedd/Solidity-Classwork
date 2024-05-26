// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Practice {
    address public owner;
    uint256[5] public arr = [1, 2, 3, 4, 5];
    uint256[5] public arr2;

    constructor() {
        owner = msg.sender;
        arr2 = [10, 20, 30, 40, 50];
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }

    function loop() public pure returns (uint256) {
        uint256 count = 0;

        for (uint256 i = 0; i < 10; i++) {
            if (i == 8) {
                continue; // skips all code below and goes back up
                //break;  // exits loop g
            }
            count = count + 2;
        }
        return count;
    }

    // Fixed sized array

    function array() public returns (uint256) {
        //get
        uint256 temp;
        temp = arr[3];

        //update
        arr[2] = 3000;

        //delete
        delete arr[4];

        //length
        uint256 len = arr.length;

        return len;
    }

    function arrayWithLoop(uint256 _x) public {
        for (uint256 i = 0; i < arr2.length; i++) {
            arr2[i] = _x + i;
        }
    }

    function createArray() public pure returns (uint256) {
        uint256[] memory arrMem = new uint256[](3);
        arrMem[1] = 33;

        return arrMem[1];
    }

    function returnArray() public view returns (uint256[5] memory) {
        return arr2;
    }
}

contract DynamicArrays {
    uint256[] public dynamicArr = [10, 299, 3244, 454, 43, 43, 1];

    function dynamicArray() public {
        //get
        //uint temp = dynamicArr[3];

        //update
        dynamicArr[4] = 222;

        //delete
        delete dynamicArr[1];

        //length
        //uint len = dynamicArr.length;

        //push
        dynamicArr.push(99);

        //pop
        dynamicArr.pop;
    }
}

contract Enums {
    enum Status {
        pending,
        shipped,
        accepted,
        rejected,
        canceled
    }

    Status status;

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
}

contract Structures {
    struct Emp {
        string name;
        uint256 age;
        address acc;
    }

    Emp public emp;
    Emp[] public emps;

    constructor() {
        emp.name = "Test";
        emp.age = 20;
        emp.acc = msg.sender;
    }

    function setValues() public {
        //1st way of initializing
        Emp memory emp1 = Emp(
            "Umer",
            21,
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        );

        //2nd way of initializing
        Emp memory emp2 = Emp({
            acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
            age: 22,
            name: "Ahmed"
        });

        //3rd way of initializing
        Emp memory emp3;
        emp3.name = "John";
        emp3.age = 23;
        emp3.acc = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

        emps.push(emp1);
        emps.push(emp2);
        emps.push(emp3);

        emps.push(Emp("Doe", 30, msg.sender));

        Emp storage emp_temp = emp; //Storage is used to store data permanently on the blockchain. Memory is used to store temporary data that is needed during the execution of a function.
        emp_temp.name = "James";

        Emp storage emp_temp2 = emps[1];
        emp_temp2.age = 31;
    }
}

contract BasicMapping {
    mapping(uint256 => string) public emp_id;

    function setIds() public {
        emp_id[31] = "Umer";
        emp_id[27] = "Ahmed";
        emp_id[33] = "John";
        emp_id[20] = "Doe";
        emp_id[14] = "Wilson";
    }

    function getId(uint256 id) public view returns (string memory) {
        return emp_id[id];
    }
}

contract AdvancedMapping {
    struct donor_dts {
        string name;
        uint age;
        string add;
        uint don;
    }

    mapping(address => donor_dts) public acc_info;

    function set(string memory _name, uint _age, string memory _add, uint _don) public {
        acc_info[msg.sender] = donor_dts(_name, _age, _add, acc_info[msg.sender].don + _don);
    } 

    function delete_info() public {
        delete acc_info[msg.sender];
    }
}
