// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "foundry-huff/HuffDeployer.sol";

interface ISortProgram {
    function sort(uint256[] calldata input)
        external
        view
        returns (uint256[] memory result);
}

contract HeapSortTest is Test {
    ISortProgram public heapSort;

    function setUp() public {
        heapSort = ISortProgram(HuffDeployer.deploy("HeapSort"));
    }

    function testEmpty() public {
        uint256[] memory input = new uint256[](0);
        uint256[] memory output = heapSort.sort(input);
        assertEq(output, input);
    }

    function testSingle() public {
        uint256[] memory input = new uint256[](1);
        input[0] = 0x01;
        uint256[] memory output = heapSort.sort(input);
        assertEq(output, input);
    }

    function testMultiple() public {
        uint256[] memory input = new uint256[](5);
        input[0] = 0x01;
        input[1] = 0xb2;
        input[2] = 0x12;
        input[3] = 0x0a;
        input[4] = 0x12;
        uint256[] memory actual = new uint256[](5);
        actual[0] = 0x01;
        actual[1] = 0x0a;
        actual[2] = 0x12;
        actual[3] = 0x12;
        actual[4] = 0xb2;
        uint256[] memory output = heapSort.sort(input);
        assertEq(output, actual);
    }
    
    function testFuzz(uint256[] calldata input) public {
        uint256[] memory output = heapSort.sort(input);
        uint256 i = 0;
        for (; i < input.length - 1;) {
            assertLe(output[i], output[i + 1]);
            unchecked {
                ++i;
            }
        }
    }
}
