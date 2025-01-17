#!/bin/bash
while true; do
  # Fetch data from API
  data=$(curl -s "https://reachsak.pagekite.me/")
  temp=$(echo "$data" | jq -r '.temperature')
  humidity=$(echo "$data" | jq -r '.humidity')
  co2=$(echo "$data" | jq -r '.co2')
  lux=$(echo "$data" | jq -r '.lux')
  # Update chaincode
  peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/orderer-ca-cert.pem" -C mychannel -n basic \
    -c "{\"function\":\"SetTemperature\",\"Args\":[\"$temp\"]}"
  peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/orderer-ca-cert.pem" -C mychannel -n basic \
    -c "{\"function\":\"SetHumidity\",\"Args\":[\"$humidity\"]}"
  peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/orderer-ca-cert.pem" -C mychannel -n basic \
    -c "{\"function\":\"SetCO2Level\",\"Args\":[\"$co2\"]}"
  peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/orderer-ca-cert.pem" -C mychannel -n basic \
    -c "{\"function\":\"SetLuxLevel\",\"Args\":[\"$lux\"]}"
  # Sleep for 3 seconds
  sleep 3
done

