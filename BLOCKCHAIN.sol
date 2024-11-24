// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleSupplyChain {
    // The owner of the contract (usually the deployer)
    address public owner;

    // Mapping to store shipment statuses using a unique shipment ID
    mapping(uint256 => string) public shipmentStatus;

    // Event emitted whenever a shipment status is updated
    event StatusUpdated(uint256 indexed shipmentId, string newStatus);

    // Modifier to allow only the owner to perform certain actions
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized"); // Ensure the caller is the owner
        _;
    }

    // Constructor sets the deployer as the owner of the contract
    constructor() {
        owner = msg.sender; // Assign deployer address to the owner variable
    }

    // Function to update the status of a shipment
    function updateStatus(uint256 shipmentId, string memory newStatus) public onlyOwner {
        shipmentStatus[shipmentId] = newStatus; // Update the shipment status
        emit StatusUpdated(shipmentId, newStatus); // Emit the status update event
    }

    // Function to view the current status of a shipment
    function getStatus(uint256 shipmentId) public view returns (string memory) {
        return shipmentStatus[shipmentId]; // Return the status of the given shipment ID
    }
}