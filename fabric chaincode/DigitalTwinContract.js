"use strict";

const { Contract } = require("fabric-contract-api");

class DigitalTwinContract extends Contract {
  // Initialize the ledger with default values
  async InitLedger(ctx) {
    const defaultValues = {
      temperature: "22",
      humidity: "50",
      CO2Level: "400",
      luxLevel: "300",
    };
    await ctx.stub.putState(
      "BuildingData",
      Buffer.from(JSON.stringify(defaultValues))
    );
  }
  // Set all values at once
  async SetBuildingData(ctx, temperature, humidity, CO2Level, luxLevel) {
    const buildingData = {
      temperature,
      humidity,
      CO2Level,
      luxLevel,
    };
    await ctx.stub.putState(
      "BuildingData",
      Buffer.from(JSON.stringify(buildingData))
    );
  }
  // Get all values at once
  async GetBuildingData(ctx) {
    const buildingDataBytes = await ctx.stub.getState("BuildingData");
    if (!buildingDataBytes || buildingDataBytes.length === 0) {
      throw new Error("Building data not found");
    }
    return JSON.parse(buildingDataBytes.toString());
  }
}

module.exports = DigitalTwinContract;
