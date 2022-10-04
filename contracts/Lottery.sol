// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Lottery {
    address payable[] public players;
    address public manager;

    constructor () { 
        manager = msg.sender; // msg.sender here is the deployer and assigned to manager.
    }

    receive() external payable(
        require(msg.value == 0.1 ether); // Min amount of ether for the transaction.
        players.push(payable(msg.sender)); // Adds to players array.
    )

    function getBalance() public view returns(uint) {
        require(msg.sender == manager)
        return address(this).balance;
    }

    function random() public view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length))); //RNG * not truly random.
    }

    function pickWinner() public {
        require(msg.sender == manager)
        require(players.length >= 3) // Requires there to be at least 3 players.

        uint r = random();
        address payable winner;

        uint index = r % players.length; // index becomes remainder of r divided by players array length.
        winner = players[index];

        winner.transfer(getBalance());
        players = new address payable[](0); //Resets the lottery.
    }
} 
