// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "foundry-huff/HuffDeployer.sol";

contract HeapSortScript is Script {
    function run() public {
        vm.broadcast();
        HuffDeployer.deploy("HeapSort");
    }
}
