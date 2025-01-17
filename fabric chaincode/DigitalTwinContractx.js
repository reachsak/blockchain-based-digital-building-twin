"use strict";
const { Contract } = require("fabric-contract-api");
class DigitalTwinContractx extends Contract {
  async InitLedger(ctx) {
    // Initialize the ledger with default values
    const defaultValues = {
      temperature: "22",
      humidity: "50",
      CO2Level: "400",
      luxLevel: "300",
    };
    for (const [key, value] of Object.entries(defaultValues)) {
      await ctx.stub.putState(key, Buffer.from(value));
    }
  }
  // Get Temperature
  async GetTemperature(ctx) {
    const value = await ctx.stub.getState("temperature");
    if (!value || value.length === 0) {
      throw new Error("Temperature not found");
    }
    return value.toString();
  }
  // Set Temperature
  async SetTemperature(ctx, newValue) {
    await ctx.stub.putState("temperature", Buffer.from(newValue));
  }
  // Get Humidity
  async GetHumidity(ctx) {
    const value = await ctx.stub.getState("humidity");
    if (!value || value.length === 0) {
      throw new Error("Humidity not found");
    }
    return value.toString();
  }
  // Set Humidity
  async SetHumidity(ctx, newValue) {
    await ctx.stub.putState("humidity", Buffer.from(newValue));
  }
  // Get CO2 Level
  async GetCO2Level(ctx) {
    const value = await ctx.stub.getState("CO2Level");
    if (!value || value.length === 0) {
      throw new Error("CO2 Level not found");
    }
    return value.toString();
  }

  // Set CO2 Level
  async SetCO2Level(ctx, newValue) {
    await ctx.stub.putState("CO2Level", Buffer.from(newValue));
  }
  // Get Lux Level
  async GetLuxLevel(ctx) {
    const value = await ctx.stub.getState("luxLevel");
    if (!value || value.length === 0) {
      throw new Error("Lux Level not found");
    }
    return value.toString();
  }
  // Set Lux Level
  async SetLuxLevel(ctx, newValue) {
    await ctx.stub.putState("luxLevel", Buffer.from(newValue));
  }
}
module.exports = DigitalTwinContractx;
