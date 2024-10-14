#!/bin/bash

while true; do
  # Run the chaincode query command to get the current value
  result=$(peer chaincode query -C mychannel -n basic -c '{"Args":["GetValue"]}')

  # Print the result
  echo "Current value: $result"

  # Send a POST request with the result
  curl -X POST \
    -H "Content-Type: application/json" \
    -d "{\"Temperature\": \"$result\"}" \
    https://:nYjvNhH3TKODSJuWL-0MTQ@tandem.autodesk.com/api/v1/timeseries/models/urn:adsk.dtm:LudKiyWAQcCPqK2gQWxNfw/streams/AQAAAMTWX-rTaksXg95DuoCDE6UAAAAA

  # Sleep for 5 seconds before querying again
  sleep 5
done


#####when it run non stop 
##  ps -ef | grep invoke.sh
### get the ID
### kill ID


### instruction 
#### run docker in background 
# go to this fabric ledger site https://hyperledger-fabric.readthedocs.io/en/latest/test_network.html
# start network creat channel 
# deploy the smart contract 
# until the invoke contract part
# bash invoke.sh 
# bash calltandem.sh
# bash combine.sh