//SPDX-License-Identifier:MIT

pragma solidity 0.8.0;

import "./Ownable.sol";

contract VaultMaster is Ownable {
    event DepositSuccessful (address indexed account, uint256 value);
    event WithdrawalSuccessful (address indexed account, uint256 value);
     
    function getBalance () public view returns (uint256){
        return address(this).balance;
    }
    function deposit () public payable {
        require (msg.value > 0, "Enter a valid amount");
        emit DepositSuccessful (msg.sender , msg.value);
    } 
    
    function withdraw(address _to, uint256_amount) public onlyOwner {
        require (_amount <= getBalance (),"Insufficient balance");

        (bool success,)= payable (_to). call{value: _amount}("");
        require (success, "Could not transfer funds");
       
       emit WithdrawalSuccessful(_to ,_amount);
    }
}