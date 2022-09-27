// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Lottery {
    address payable[] public players;
    address public manager;

    constructor () {
        manager = msg.sender;
    }

    receive() external payable(
        require(msg.value == 0.1 ether);
        players.push(payable(msg.sender));
    )

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
} 
