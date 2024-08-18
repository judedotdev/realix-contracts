// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @title Vendor - A contract for managing an NFT collection of products
/// @notice This contract allows minting and managing tokens for a specific collection
/// @author Jude (https://github.com/judedotdev)
contract Vendor is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;
    address public factory;

    /// @notice Constructor to set the collection name and symbol, and the factory address
    /// @param _factory The address of the VendorFactory contract
    constructor(
        address _factory,
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) Ownable(msg.sender) {
        factory = _factory;
        tokenCounter = 0;
    }

    /// @notice Function to mint a new token representing a product
    /// @param tokenURI The URI pointing to the product's metadata (e.g., image, description)
    /// @return newTokenId The ID of the newly created token
    function mintProduct(
        string memory tokenURI
    ) public onlyOwner returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI); // Set URI for the newly minted token
        tokenCounter += 1;
        return newTokenId;
    }
}
