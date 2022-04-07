// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Bank {
    //declaration
    mapping (address => uint) userBalances;

    //get the balance of each user by address
    function getUserBalance(address user) public view returns(uint) {
        return userBalances[user];
    }

    //adding balance to the user by getting value
    function addToBalance() public payable {
        userBalances[msg.sender] = userBalances[msg.sender] + msg.value;
    }

    function withdrawBalance() public {
        uint amount = userBalances[msg.sender];
        (bool temp,) = msg.sender.call{value : amount}("");
        require(temp == true, 'error');
        userBalances[msg.sender] = 0;
    }
}
