//SPDX-License-Identifier: MIT

// This code isn't something which is very useful IRL but i made it to practice Solidity :)

pragma solidity ^0.8.10;

contract PiggyBank {
    event Deposit(uint256 amount);
    address public owner = msg.sender;

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "not owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}
