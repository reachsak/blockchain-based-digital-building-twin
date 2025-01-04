//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import {Chainlink, ChainlinkClient} from "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import {ConfirmedOwner} from "@chainlink/contracts/src/v0.8/shared/access/ConfirmedOwner.sol";
import {LinkTokenInterface} from "@chainlink/contracts/src/v0.8/shared/interfaces/LinkTokenInterface.sol";
contract MultiWordConsumer is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;
    bytes32 private jobId;
    uint256 private fee;
    // multiple params returned in a single oracle response
    uint256 public temperature;
    uint256 public humidity;
    uint256 public CO2Level;
    uint256 public luxLevel;
    event RequestMultipleFulfilled(
        bytes32 indexed requestId,
        uint256 temperature,
        uint256 humidity,
        uint256 CO2Level,
        uint256 luxLevel
    );
    constructor() ConfirmedOwner(msg.sender) {
        _setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
        _setChainlinkOracle(0x6090149792dAAeE9D1D568c9f9a6F6B46AA29eFD);
        jobId = "53f9755920cd451a8fe46f5087468395";
        fee = (1 * LINK_DIVISIBILITY) / 10; 
    }
    function requestMultipleParameters() public {
        Chainlink.Request memory req = _buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillMultipleParameters.selector
        );
        req._add(
            "urltemperature",
            "https://reachsak.pagekite.me"
        );
        req._add("pathtemperature", "Temperature");
        req._add(
            "urlhumidity",
            "https://reachsak.pagekite.me"
        );
        req._add("pathhumidity", "Humidity");
        req._add(
            "urlCO2Level",
            "https://reachsak.pagekite.me"
        );
        req._add("pathCO2Level", "CO2");
        req._add(
            "urlluxLevel",
            "https://reachsak.pagekite.me"
        );
        req._add("pathluxLevel", "luxLevel");
        _sendChainlinkRequest(req, fee); // MWR API.
    }
    function fulfillMultipleParameters(
        bytes32 requestId,
        uint256 temperatureResponse,
        uint256 humidityResponse,
        uint256 CO2LevelResponse,
        uint256 luxLevelResponse
    ) public recordChainlinkFulfillment(requestId) {
        emit RequestMultipleFulfilled(
            requestId,
            temperatureResponse,
            humidityResponse,
            CO2LevelResponse,
            luxLevelResponse
        );
        temperature = temperatureResponse;
        humidity = humidityResponse;
        CO2Level = CO2LevelResponse;
        luxLevel = luxLevelResponse;
    }
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(_chainlinkTokenAddress());
        require(
            link.transfer(msg.sender, link.balanceOf(address(this))),
            "Unable to transfer"
        );
    }
}
