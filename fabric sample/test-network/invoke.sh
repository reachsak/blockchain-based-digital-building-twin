while true; do
  # Fetch temperature from API (replace <API_URL> with your actual API endpoint)
  temp=$(curl -s "https://reachsak.pagekite.me/" | jq -r '.Temperature')

  # Run the chaincode invoke command with the fetched temperature value
  peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c "{\"function\":\"SetValue\",\"Args\":[\"$temp\"]}"
  
  # Sleep for 5 seconds before running the command again
  sleep 3
done
