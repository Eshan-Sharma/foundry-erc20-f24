//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract AdvaitaToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("AdvaitaToken", "ADV") {
        _mint(msg.sender, initialSupply);
    }
}
