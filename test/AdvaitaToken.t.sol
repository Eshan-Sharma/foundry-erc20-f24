//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "lib/forge-std/src/Test.sol";
import {DeployAdvaitaToken} from "../script/DeployAdvaitaToken.s.sol";
import {AdvaitaToken} from "../src/AdvaitaToken.sol";

contract AdvaitaTokenTest is Test {
    AdvaitaToken public advaitaToken;
    DeployAdvaitaToken public deployer;
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployAdvaitaToken();
        advaitaToken = deployer.run();
        vm.prank(address(msg.sender));
        advaitaToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, advaitaToken.balanceOf(bob));
    }

    function testAllowanced() public {
        uint256 initialAllowance = 1000;
        vm.prank(bob);
        advaitaToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;
        vm.prank(alice);
        advaitaToken.transferFrom(bob, alice, transferAmount);

        assertEq(advaitaToken.balanceOf(alice), transferAmount);
        assertEq(advaitaToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }
}
