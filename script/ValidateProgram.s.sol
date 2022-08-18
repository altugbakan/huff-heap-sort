// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "foundry-huff/HuffDeployer.sol";

interface ISortProgram {
    function sort(uint256[] calldata input)
        external
        view
        returns (uint256[] memory result);
}

interface ISortProgramContest {
    function qualify(ISortProgram program) external payable;
}

contract ValidateProgram is Script {
    address constant CONTEST_ADDRESS =
        0xB64A8F57b46Df3F303d72204acCF4F8F680D6dCf;

    function run() public {
        ISortProgram heapSort = ISortProgram(HuffDeployer.deploy("HeapSort"));
        ISortProgramContest contest = ISortProgramContest(CONTEST_ADDRESS);
        contest.qualify{value: 10 ether}(heapSort);
    }
}
