//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "lib/forge-std/src/Script.sol";
import {AdvaitaToken} from "src/AdvaitaToken.sol";

contract DeployAdvaitaToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external {
        vm.startBroadcast();
        new AdvaitaToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
    }
}
