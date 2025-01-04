// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract BuildingAutomationConfig {
    // Variables for controlling the smart building facilities
    int256 public minTemperature;
    int256 public maxTemperature;
    uint256 public minCO2Level;
    uint256 public maxCO2Level;
    uint256 public minLuxLevel;
    uint256 public maxLuxLevel;
    uint256 public minHumidity;
    uint256 public maxHumidity;
    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }
    event MinTemperatureUpdated(int256 minTemperature);
    event MaxTemperatureUpdated(int256 maxTemperature);
    event MinCO2LevelUpdated(uint256 minCO2Level);
    event MaxCO2LevelUpdated(uint256 maxCO2Level);
    event MinLuxLevelUpdated(uint256 minLuxLevel);
    event MaxLuxLevelUpdated(uint256 maxLuxLevel);
    event MinHumidityUpdated(uint256 minHumidity);
    event MaxHumidityUpdated(uint256 maxHumidity);
    constructor() {
        owner = msg.sender;
    }
    // Setter functions
    function setMinTemperature(int256 _minTemperature) public onlyOwner {
        minTemperature = _minTemperature;
        emit MinTemperatureUpdated(_minTemperature);
    }
    function setMaxTemperature(int256 _maxTemperature) public onlyOwner {
        maxTemperature = _maxTemperature;
        emit MaxTemperatureUpdated(_maxTemperature);
    }
    function setMinCO2Level(uint256 _minCO2Level) public onlyOwner {
        minCO2Level = _minCO2Level;
        emit MinCO2LevelUpdated(_minCO2Level);
    }
    function setMaxCO2Level(uint256 _maxCO2Level) public onlyOwner {
        maxCO2Level = _maxCO2Level;
        emit MaxCO2LevelUpdated(_maxCO2Level);
    }
    function setMinLuxLevel(uint256 _minLuxLevel) public onlyOwner {
        minLuxLevel = _minLuxLevel;
        emit MinLuxLevelUpdated(_minLuxLevel);
    }
    function setMaxLuxLevel(uint256 _maxLuxLevel) public onlyOwner {
        maxLuxLevel = _maxLuxLevel;
        emit MaxLuxLevelUpdated(_maxLuxLevel);
    }
    function setMinHumidity(uint256 _minHumidity) public onlyOwner {
        minHumidity = _minHumidity;
        emit MinHumidityUpdated(_minHumidity);
    }
    function setMaxHumidity(uint256 _maxHumidity) public onlyOwner {
        maxHumidity = _maxHumidity;
        emit MaxHumidityUpdated(_maxHumidity);
    }
    // Getter functions
    function getMinTemperature() public view returns (int256) {
        return minTemperature;
    }
    function getMaxTemperature() public view returns (int256) {
        return maxTemperature;
    }
    function getMinCO2Level() public view returns (uint256) {
        return minCO2Level;
    }
    function getMaxCO2Level() public view returns (uint256) {
        return maxCO2Level;
    }
    function getMinLuxLevel() public view returns (uint256) {
        return minLuxLevel;
    }
    function getMaxLuxLevel() public view returns (uint256) {
        return maxLuxLevel;
    }
    function getMinHumidity() public view returns (uint256) {
        return minHumidity;
    }
    function getMaxHumidity() public view returns (uint256) {
        return maxHumidity;
    }
}

