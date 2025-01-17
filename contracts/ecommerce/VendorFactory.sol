// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Vendor} from "./Vendor.sol";

/// @title VendorFactory - A contract for creating and managing NFT collections
/// @notice This contract allows sellers to create new NFT collections and manage their products
/// @author Jude (https://github.com/judedotdev)
contract VendorFactory {
    mapping(address => address[]) public sellerCollections;

    event CollectionCreated(address seller, address collectionAddress);

    /// @notice Function to create a new NFT collection for the seller
    /// @return collectionAddress The address of the newly created Vendor contract
    function createCollection(
        string memory name,
        string memory symbol
    ) public returns (address collectionAddress) {
        address collectionOwner = msg.sender;
        Vendor newCollection = new Vendor(
            address(this),
            collectionOwner,
            name,
            symbol
        );
        sellerCollections[collectionOwner].push(address(newCollection));
        emit CollectionCreated(collectionOwner, address(newCollection));
        return address(newCollection);
    }
}
