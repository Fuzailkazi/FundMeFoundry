// SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {Test,console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    function setUp() public{
        // fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        DeployFundMe dFundMe = new DeployFundMe();
        fundMe = dFundMe.run(); 
    }

    function testMinimumDollarIsFive() public{
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public{
    //    assertEq(fundMe.i_owner(), address(this));
       assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public{ 
        // run this function using the sepolia rpc as the version is on the sepolia contract
        uint256 version = fundMe.getVersion();
        assertEq(version,4);
    }
    
}