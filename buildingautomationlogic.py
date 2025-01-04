from web3 import Web3
import time
import subprocess
# Connect to Ethereum network
infura_url = "https://sepolia.infura.io/v3/29ed729d7617400ab427b75b16c31c63"
web3 = Web3(Web3.HTTPProvider(infura_url))
# Check connection
if not web3.isConnected():
    raise Exception("Failed to connect to Ethereum network")
# Smart contract details
contract_address = "0x32fE723d34c0AaAF2de205E4Af6B6dc068C59364"
abi = [[ { "inputs": [], "stateMutability": "nonpayable", "type": "constructor" }, { "anonymous": False, "inputs": [ { "indexed": False, "internalType": "uint256", "name": "maxCO2Level", "type": "uint256" } ], "name": "MaxCO2LevelUpdated", "type": "event" }, { "anonymous": False, "inputs": [ { "indexed": False, "internalType": "uint256", "name": "maxHumidity", "type": "uint256" } ], "name": "MaxHumidityUpdated", "type": "event" }, { "anonymous": False, "inputs": [ { "indexed": False, "internalType": "uint256", "name": "maxLuxLevel", "type": "uint256" } ], "name": "MaxLuxLevelUpdated", "type": "event" }, { "anonymous": False, "inputs": [ { "indexed": False, "internalType": "int256", "name": "maxTemperature", "type": "int256" } ], "name": "MaxTemperatureUpdated", "type": "event" }, { "anonymous": False, "inputs": [ { "indexed": False, "internalType": "uint256", "name": "minCO2Level", "type": "uint256" } ], "name": "MinCO2LevelUpdated", "type": "event" }, { "anonymous": False, "inputs": [ { "indexed": False, "internalType": "uint256", "name": "minHumidity", "type": "uint256" } ], "name": "MinHumidityUpdated", "type": "event" }, { "anonymous": False, "inputs": [ { "indexed": False, "internalType": "uint256", "name": "minLuxLevel", "type": "uint256" } ], "name": "MinLuxLevelUpdated", "type": "event" }, { "anonymous": False, "inputs": [ { "indexed": False, "internalType": "int256", "name": "minTemperature", "type": "int256" } ], "name": "MinTemperatureUpdated", "type": "event" }, { "inputs": [ { "internalType": "uint256", "name": "_maxCO2Level", "type": "uint256" } ], "name": "setMaxCO2Level", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [ { "internalType": "uint256", "name": "_maxHumidity", "type": "uint256" } ], "name": "setMaxHumidity", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [ { "internalType": "uint256", "name": "_maxLuxLevel", "type": "uint256" } ], "name": "setMaxLuxLevel", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [ { "internalType": "int256", "name": "_maxTemperature", "type": "int256" } ], "name": "setMaxTemperature", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [ { "internalType": "uint256", "name": "_minCO2Level", "type": "uint256" } ], "name": "setMinCO2Level", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [ { "internalType": "uint256", "name": "_minHumidity", "type": "uint256" } ], "name": "setMinHumidity", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [ { "internalType": "uint256", "name": "_minLuxLevel", "type": "uint256" } ], "name": "setMinLuxLevel", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [ { "internalType": "int256", "name": "_minTemperature", "type": "int256" } ], "name": "setMinTemperature", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [], "name": "getMaxCO2Level", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "getMaxHumidity", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "getMaxLuxLevel", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "getMaxTemperature", "outputs": [ { "internalType": "int256", "name": "", "type": "int256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "getMinCO2Level", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "getMinHumidity", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "getMinLuxLevel", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "getMinTemperature", "outputs": [ { "internalType": "int256", "name": "", "type": "int256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "maxCO2Level", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "maxHumidity", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "maxLuxLevel", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "maxTemperature", "outputs": [ { "internalType": "int256", "name": "", "type": "int256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "minCO2Level", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "minHumidity", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "minLuxLevel", "outputs": [ { "internalType": "uint256", "name": "", "type": "uint256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "minTemperature", "outputs": [ { "internalType": "int256", "name": "", "type": "int256" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "owner", "outputs": [ { "internalType": "address", "name": "", "type": "address" } ], "stateMutability": "view", "type": "function" } ]]

contract = web3.eth.contract(address=contract_address, abi=abi)
# Function to fetch contract values
def fetch_contract_values():
    min_temperature = contract.functions.getMinTemperature().call()
    max_temperature = contract.functions.getMaxTemperature().call()
    min_humidity = contract.functions.getMinHumidity().call()
    max_humidity = contract.functions.getMaxHumidity().call()
    min_co2 = contract.functions.getMinCO2Level().call()
    max_co2 = contract.functions.getMaxCO2Level().call()
    min_lux = contract.functions.getMinLuxLevel().call()
    max_lux = contract.functions.getMaxLuxLevel().call()
    return min_temperature, max_temperature, min_humidity, max_humidity, min_co2, max_co2, min_lux, max_lux
while True:
    min_temp, max_temp, min_hum, max_hum, min_co2, max_co2, min_lux, max_lux = fetch_contract_values()
    # Fetch current environmental data (Replace with actual sensor data retrieval)
    current_temperature = 25  # Example value
    current_humidity = 45      # Example value
    current_co2 = 600          # Example value
    current_lux = 200          # Example value
    # Logic for Smart Light (0-100%)
    if current_lux < min_lux:
        subprocess.run(["python3", "control_light.py", "on", "90"])
    elif current_lux < min_lux + 50:
        subprocess.run(["python3", "control_light.py", "on", "70"])
    elif current_lux < max_lux:
        subprocess.run(["python3", "control_light.py", "on", "50"])
    elif current_lux > max_lux:
        subprocess.run(["python3", "control_light.py", "off"])

    # Logic for Smart Fan (Level 1-10)
    if current_temperature > max_temp + 4:
        subprocess.run(["python3", "control_fan.py", "10"])
    elif current_temperature > max_temp:
        subprocess.run(["python3", "control_fan.py", "7"])
    elif current_temperature > min_temp:
        subprocess.run(["python3", "control_fan.py", "4"])
    elif current_temperature < min_temp - 2:
        subprocess.run(["python3", "control_fan.py", "0"])

    # Logic for Smart Humidifier (Level 1-10)
    if current_humidity < min_hum:
        subprocess.run(["python3", "control_humidifier.py", "8"])
    elif current_humidity < min_hum + 10:
        subprocess.run(["python3", "control_humidifier.py", "6"])
    elif current_humidity > max_hum + 10:
        subprocess.run(["python3", "control_humidifier.py", "0"])
    elif current_humidity > max_hum:
        subprocess.run(["python3", "control_humidifier.py", "3"])

    # Logic for Air Purifier (Level 1-10)
    if current_co2 > max_co2 + 200:
        subprocess.run(["python3", "control_air_purifier.py", "10"])
    elif current_co2 > max_co2:
        subprocess.run(["python3", "control_air_purifier.py", "7"])
    elif current_co2 > min_co2:
        subprocess.run(["python3", "control_air_purifier.py", "3"])
    else:
        subprocess.run(["python3", "control_air_purifier.py", "0"])

    # Wait for 5 seconds before the next check
    time.sleep(60)

