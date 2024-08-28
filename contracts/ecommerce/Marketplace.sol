// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Vendor} from "./Vendor.sol";

/// @title Marketplace
/// @notice A contract for buying and selling NFTs from different collections
/// @dev This contract allows users to list their NFTs for sale and purchase NFTs
/// @author Jude (https://github.com/judedotdev)
contract Marketplace {
    /// @dev Represents a sale listing for an NFT
    struct Sale {
        address seller; ///< The address of the seller
        uint256 tokenId; ///< The ID of the NFT being sold
        uint256 price; ///< The price of the NFT in wei
        address vendor; ///< The address of the Vendor contract for the NFT
        bool isSold; ///< Whether the NFT has been sold
    }

    mapping(uint256 => Sale) public sales; ///< Mapping from sale ID to Sale struct
    uint256 public saleCounter; ///< Counter for sale IDs

    /// @notice Event emitted when a product is listed for sale
    /// @param saleId The ID of the sale listing
    /// @param seller The address of the seller
    /// @param tokenId The ID of the token being listed
    /// @param price The price of the token in wei
    /// @param vendor The address of the Vendor contract containing the token
    event ProductListed(
        uint256 indexed saleId,
        address indexed seller,
        uint256 indexed tokenId,
        uint256 price,
        address vendor
    );

    /// @notice Event emitted when a product is sold
    /// @param saleId The ID of the sale listing
    /// @param buyer The address of the buyer
    /// @param tokenId The ID of the token being purchased
    /// @param price The price of the token in wei
    event ProductSold(
        uint256 indexed saleId,
        address indexed buyer,
        uint256 indexed tokenId,
        uint256 price
    );

    /// @notice Function to list an NFT for sale
    /// @param _vendor The address of the Vendor contract containing the NFT
    /// @param _tokenId The ID of the token to be listed
    /// @param _price The price of the token in wei
    /// @dev Requires that the sender owns the NFT and that it is not already listed
    function listForSale(
        address _vendor,
        uint256 _tokenId,
        uint256 _price
    ) public {
        Vendor vendor = Vendor(_vendor);
        require(
            vendor.ownerOf(_tokenId) == msg.sender,
            "You do not own this token"
        );
        require(!_isTokenListed(_vendor, _tokenId), "Token is already listed");

        sales[saleCounter] = Sale({
            seller: msg.sender,
            tokenId: _tokenId,
            price: _price,
            vendor: _vendor,
            isSold: false
        });

        emit ProductListed(saleCounter, msg.sender, _tokenId, _price, _vendor);
        saleCounter += 1;
    }

    /// @notice Function to buy a listed NFT
    /// @param _saleId The ID of the sale listing
    /// @dev Requires that the sale is not already completed and the buyer sends sufficient funds
    function buyProduct(uint256 _saleId) public payable {
        Sale storage sale = sales[_saleId];
        require(!sale.isSold, "Product already sold");
        require(msg.value >= sale.price, "Insufficient funds");

        Vendor(sale.vendor).safeTransferFrom(
            sale.seller,
            msg.sender,
            sale.tokenId
        );
        payable(sale.seller).transfer(msg.value);

        sale.isSold = true;

        emit ProductSold(_saleId, msg.sender, sale.tokenId, sale.price);
    }

    /// @notice Internal function to check if a token is already listed
    /// @param _vendor The address of the Vendor contract
    /// @param _tokenId The ID of the token
    /// @return True if the token is listed, false otherwise
    /// @dev Iterates over all sales to determine if the token is listed
    function _isTokenListed(
        address _vendor,
        uint256 _tokenId
    ) internal view returns (bool) {
        for (uint256 i = 0; i < saleCounter; i++) {
            if (
                sales[i].vendor == _vendor &&
                sales[i].tokenId == _tokenId &&
                !sales[i].isSold
            ) {
                return true;
            }
        }
        return false;
    }
}
