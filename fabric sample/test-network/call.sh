while true; do
  # Run the chaincode query command to get the current value
  result=$(peer chaincode query -C mychannel -n basic -c '{"Args":["GetValue"]}')

  # Print the result
  echo "Current value: $result"

  # Sleep for 5 seconds before querying again
  sleep 5
done
