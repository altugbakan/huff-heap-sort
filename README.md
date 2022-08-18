# Huff Heap Sort
Heap Sort algorithm implemented in [Huff](https://huff.sh).

Created for [On-Chain Sorting Program Contest](https://medium.com/superfluid-blog/call-for-participation-an-on-chain-sorting-program-contest-aa4c01e688a).

## Requirements

- [Git](https://git-scm.com/downloads)
- [Foundry](https://getfoundry.sh/)
- [Huff](https://huff.sh/)

## Usage

1. Clone or Fork this repository

```shell
git clone https://github.com/altugbakan/huff-heap-sort
cd huff-heap-sort
```

2. Install dependencies

```shell
forge install
```

3. Build and test contracts

```shell
forge build
forge test
```

This contract expects only one uint256[] dynamic array on calldata, encoded using Solidity calldata rules. It returns one uint256[] dynamic array on memory, encoded using Solidity memory rules.

## Acknowledgements
- [Heap Sort Algorithm](https://www.programiz.com/dsa/heap-sort)
- [evm.codes](https://www.evm.codes/)
- [Huff Docs](https://docs.huff.sh/tutorial/evm-basics/)

## Disclaimer
This contract is not audited, use it at your own caution.