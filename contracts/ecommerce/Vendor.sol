// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @title Vendor - A contract for managing an NFT collection of products
/// @notice This contract allows minting and managing tokens for a specific collection
/// @author Jude (https://github.com/judedotdev)
contract Vendor is ERC721, Ownable {
    uint256 public tokenCounter;
    address public factory;

    /// @notice Constructor to set the collection name and symbol, and the factory address
    /// @param _factory The address of the VendorFactory contract
    constructor(
        address _factory,
        address _collectionOwner,
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) Ownable(_collectionOwner) {
        factory = _factory;
        tokenCounter = 0;
    }

    /// @dev Internal function to return the base URI for all tokens.
    /// @return The base URI string that is prefixed to all token URIs.
    function _baseURI() internal pure override returns (string memory) {
        return "https://realix.vercel.app/api/v0/vendor/";
    }

    /// @notice Mints a new token representing a product.
    /// @dev This function mints a new NFT and assigns it to the specified address.
    /// @param to The address to which the newly minted token will be assigned.
    /// @return newTokenId The ID of the newly created token.
    function mintProduct(address to) public onlyOwner returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(to, newTokenId);
        tokenCounter += 1;
        return newTokenId;
    }
}
