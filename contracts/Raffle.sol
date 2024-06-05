// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.8;

import {VRFConsumerBaseV2} from "@chainlink/contracts/src/v0.8/vrf/VRFConsumerBaseV2.sol";

error Raffle__NotEnoughETHEntered();

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Raffle is VRFConsumerBaseV2 {
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    /*events*/
    event RaffleEnter(address indexed player);

    constructor(
        address vrfCoordinatorV2,
        uint256 entranceFee
    ) VRFConsumerBaseV2(vrfCoordinatorV2) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughETHEntered();
        } else {
            s_players.push(payable(msg.sender));
            emit RaffleEnter(msg.sender);
        }
    }

    function pickRandomWinner() external {}

    function fullfillRandomWords(
        uint256 requestID,
        uint256[] memory randomWords
    ) internal override {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return (s_players[index]);
    }

    function fulfillRandomWords(
        uint256 requestId,
        uint256[] memory randomWords
    ) internal virtual override {}
}
