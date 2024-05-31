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
        uint256 age;
        string add;
        uint256 don;
    }

    mapping(address => donor_dts) public acc_info;

    function set(
        string memory _name,
        uint256 _age,
        string memory _add,
        uint256 _don
    ) public {
        acc_info[msg.sender] = donor_dts(
            _name,
            _age,
            _add,
            acc_info[msg.sender].don + _don
        );
    }

    function delete_info() public {
        delete acc_info[msg.sender];
    }
}

contract Events {
    event balance(address acc, string message, uint256 value);

    function setData(uint256 _val) public {
        emit balance(msg.sender, "Has value", _val);
    }

    event chat(address indexed from, address to, string message);

    function sendMessage(address _to, string memory _message) public {
        emit chat(msg.sender, _to, _message);
    }
}

contract Require {
    address public owner = msg.sender;
    uint256 public age = 25;

    function checkRequire(uint256 x) public {
        age = age + 5;
        require(x > 2, "value of x is less than 2");
    }

    function onlyOwner() public {
        require(owner == msg.sender, "You are not the owner");
        age = age - 2;
    }
}

contract Modifiers {
    modifier sameCode() {
        for (uint256 i = 0; i < 10; i++) {
            //code
        }
        _;
        //code
    }

    function fun1() public pure sameCode returns (string memory) {
        return "fun1 says hi";
    }

    function fun2() public pure sameCode returns (uint256 x) {
        x = 20; // this also returns x
    }

    function fun3() public view sameCode returns (address) {
        return msg.sender;
    }
}

contract Payable {
    address payable public owner = payable(msg.sender);

    constructor() payable {}

    function getETH() public payable {}

    function checkBal() public view returns (uint256) {
        return address(this).balance;
    }
}

contract Fallback_Receive {
    fallback() external payable {
        // Receives data + ethers
    }

    receive() external payable {
        // Receives only ethers
    }

    function checkBal() public view returns (uint256) {
        return address(this).balance;
    }
}

contract SendETH {
    //address payable public getter = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    receive() external payable {}

    function checkBalanc() public view returns (uint256) {
        return address(this).balance;
    }

    event log(uint value);

    function send(address payable _address) public payable {

        emit log(msg.value);

        bool sent = _address.send(msg.value);
        require(sent, "Transaction Failed!");
    }

    function transfer(address payable _address) public payable {
        _address.transfer(msg.value);
    }

    function call(address payable _address) public {
        (bool sent, ) = _address.call{value: 1 ether}("");
        require(sent, "Transaction Failed!");
    }
}


contract NFTMarketplace {
    // Basic structure to represent an NFT
    struct NFT {
        uint256 tokenId;
        address owner;
        string tokenURI;
    }

    // Structure to represent an NFT listing
    struct Listing {
        uint256 tokenId;
        address payable seller;
        uint256 price;
        bool sold;
    }

    // Mapping from tokenId to NFT details
    mapping(uint256 => NFT) public nfts;
    
    // Mapping from tokenId to its listing
    mapping(uint256 => Listing) public listings;

    // Counter for token IDs
    uint256 private _tokenIdCounter;

    // Events to notify when an NFT is minted, listed, or sold
    event NFTMinted(uint256 indexed tokenId, address owner, string tokenURI);
    event NFTListed(uint256 indexed tokenId, address seller, uint256 price);
    event NFTSold(uint256 indexed tokenId, address buyer, uint256 price);

    // Function to mint a new NFT
    function mintNFT(string memory tokenURI) public {
        uint256 tokenId = _tokenIdCounter;
        nfts[tokenId] = NFT({
            tokenId: tokenId,
            owner: msg.sender,
            tokenURI: tokenURI
        });
        _tokenIdCounter += 1;

        emit NFTMinted(tokenId, msg.sender, tokenURI);
    }

    // Function to list an NFT for sale
    function listNFT(uint256 tokenId, uint256 price) public {
        require(nfts[tokenId].owner == msg.sender, "Only the owner can list this NFT");
        require(price > 0, "Price must be greater than zero");

        listings[tokenId] = Listing({
            tokenId: tokenId,
            seller: payable(msg.sender),
            price: price,
            sold: false
        });

        emit NFTListed(tokenId, msg.sender, price);
    }

    // Function to buy a listed NFT
    function buyNFT(uint256 tokenId) public payable {
        Listing storage listing = listings[tokenId];
        require(listing.price > 0, "This NFT is not for sale");
        require(msg.value == listing.price, "Incorrect value sent");
        require(!listing.sold, "This NFT is already sold");

        listing.sold = true;

        // Transfer ownership of the NFT
        nfts[tokenId].owner = msg.sender;

        // Transfer the sale amount to the seller
        listing.seller.transfer(msg.value);

        emit NFTSold(tokenId, msg.sender, listing.price);
    }

    // Function to cancel an NFT listing
    function cancelListing(uint256 tokenId) public {
        require(nfts[tokenId].owner == msg.sender, "Only the owner can cancel this listing");
        require(listings[tokenId].price > 0, "This NFT is not listed");

        delete listings[tokenId];
    }
}