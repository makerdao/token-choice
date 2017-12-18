pragma solidity ^0.4.19;

import "ds-test/test.sol";

import "./Choice.sol";

contract ChoiceTest is DSTest {
    Choice choice;

    function setUp() public {
        choice = new Choice();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
