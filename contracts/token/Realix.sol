// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Realix is ERC20 {
    constructor(uint256 initialSupply) ERC20("Realix", "RLX") {
        _mint(msg.sender, initialSupply);
    }
}
