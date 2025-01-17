#!/bin/bash
# Define thresholds for automation
TEMP_LOW=16
TEMP_MIN=18
TEMP_OPTIMAL=22
TEMP_MAX=26
TEMP_HIGH=30
HUMIDITY_LOW=30
HUMIDITY_MIN=40
HUMIDITY_OPTIMAL=50
HUMIDITY_MAX=60
HUMIDITY_HIGH=70
CO2_SAFE=400
CO2_ELEVATED=800
CO2_DANGEROUS=1000
LUX_DARK=50
LUX_LOW=100
LUX_OPTIMAL=300
LUX_HIGH=500
# Infinite loop for monitoring
while true; do
    # Fetch values from the chaincode
    TEMPERATURE=$(peer chaincode query -C mychannel -n buildingautomation -c '{"Args":["GetTemperature"]}')
    HUMIDITY=$(peer chaincode query -C mychannel -n buildingautomation -c '{"Args":["GetHumidity"]}')
    CO2=$(peer chaincode query -C mychannel -n buildingautomation -c '{"Args":["GetCO2Level"]}')
    LUX=$(peer chaincode query -C mychannel -n buildingautomation -c '{"Args":["GetLuxLevel"]}')

    # Logic for Smart Light (0-100%)
    if [ "$LUX" -lt "$LUX_DARK" ]; then
        echo "Turning on light at 90% brightness (very dark)"
        python3 control_light.py on 90
    elif [ "$LUX" -lt "$LUX_LOW" ]; then
        echo "Turning on light at 70% brightness (low light)"
        python3 control_light.py on 70
    elif [ "$LUX" -lt "$LUX_OPTIMAL" ]; then
        echo "Turning on light at 50% brightness (comfortable light)"
        python3 control_light.py on 50
    elif [ "$LUX" -gt "$LUX_HIGH" ]; then
        echo "Turning off the light (too bright)"
        python3 control_light.py off
    else
        echo "Light brightness is optimal, no action required"
    fi

    # Logic for Smart Fan (Level 1-10)
    if [ "$TEMPERATURE" -gt "$TEMP_HIGH" ]; then
        echo "Turning on fan at level 10 (very hot)"
        python3 control_fan.py 10
    elif [ "$TEMPERATURE" -gt "$TEMP_MAX" ]; then
        echo "Turning on fan at level 7 (hot)"
        python3 control_fan.py 7
    elif [ "$TEMPERATURE" -gt "$TEMP_OPTIMAL" ]; then
        echo "Turning on fan at level 4 (slightly warm)"
        python3 control_fan.py 4
    elif [ "$TEMPERATURE" -lt "$TEMP_LOW" ]; then
        echo "Turning off the fan (very cold)"
        python3 control_fan.py 0
    else
        echo "Fan speed is optimal, no action required"
    fi
    # Logic for Smart Humidifier (Level 1-10)
    if [ "$HUMIDITY" -lt "$HUMIDITY_LOW" ]; then
        echo "Increasing humidifier to level 8 (very dry)"
        python3 control_humidifier.py 8
    elif [ "$HUMIDITY" -lt "$HUMIDITY_MIN" ]; then
        echo "Increasing humidifier to level 6 (dry)"
        python3 control_humidifier.py 6
    elif [ "$HUMIDITY" -gt "$HUMIDITY_HIGH" ]; then
        echo "Turning off the humidifier (very humid)"
        python3 control_humidifier.py 0
    elif [ "$HUMIDITY" -gt "$HUMIDITY_MAX" ]; then
        echo "Reducing humidifier to level 3 (slightly humid)"
        python3 control_humidifier.py 3
    else
        echo "Humidity is optimal, no action required"
    fi
    # Logic for Air Purifier (Level 1-10)
    if [ "$CO2" -gt "$CO2_DANGEROUS" ]; then
        echo "Turning on air purifier at level 10 (dangerous CO2 level)"
        python3 control_air_purifier.py 10
    elif [ "$CO2" -gt "$CO2_ELEVATED" ]; then
        echo "Turning on air purifier at level 7 (elevated CO2 level)"
        python3 control_air_purifier.py 7
    elif [ "$CO2" -gt "$CO2_SAFE" ]; then
        echo "Turning on air purifier at level 3 (moderate CO2 level)"
        python3 control_air_purifier.py 3
    else
        echo "Turning off the air purifier (CO2 level is safe)"
        python3 control_air_purifier.py 0
    fi
    # Wait for 5 seconds before the next check
    sleep 5
done
