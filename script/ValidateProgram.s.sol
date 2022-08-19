// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "foundry-huff/HuffDeployer.sol";

interface ISortProgram {
    function sort(uint256[] calldata input)
        external
        view
        returns (uint256[] memory result);
}

interface ISortProgramContest {
    function validateProgram(address program)
        external
        returns (
            bool success,
            uint256 reason,
            uint256 gasUsed
        );

    function END_DATE() external view returns (uint256 timestamp);
}

contract ValidateProgram is Script {
    address constant CONTEST_ADDRESS =
        0xB64A8F57b46Df3F303d72204acCF4F8F680D6dCf;

    function run() public {
        ISortProgramContest contest = ISortProgramContest(CONTEST_ADDRESS);
        vm.warp(contest.END_DATE() - 1);
        ISortProgram heapSort = ISortProgram(HuffDeployer.deploy("HeapSort"));
        (bool success, , uint256 gasUsed) = contest.validateProgram(
            address(heapSort)
        );
        require(success, "Program is not valid.");
        console.log("Gas Used: %d", gasUsed);
    }
}
