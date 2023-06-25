// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract mytoken is ERC20, Ownable{
    constructor() ERC20("Hiteshcoin","HC"){
         _mint(msg.sender, 1000000*(10**uint256(decimals()))); //mint new tokens -1000000 with decimals
    }
    function mint(address add1,uint amount) public onlyOwner returns(bool){
        require(add1!= address(0) && amount!=uint256(0),"ERC20: Invalid input!!");
        _mint(add1,amount);
        return true;
    }
    function burn(address account,uint amount) public onlyOwner returns(bool){
        require(account!= address(0) && amount!=uint256(0),"ERC20: Invalid input!!");
        _burn(account,amount);
        return true; 
    }
    function buy() public payable returns(bool){
        require(msg.sender.balance>=msg.value && msg.value!=0 ether);
        uint amount=msg.value*1000;
        _transfer(owner(),_msgSender(), amount);
        return true;
    }
    function withdraw(uint amount) public onlyOwner returns(bool){
        require(amount<address(this).balance,"Invalid Input");
        payable(_msgSender()).transfer(amount);
        return true; 
    }

}