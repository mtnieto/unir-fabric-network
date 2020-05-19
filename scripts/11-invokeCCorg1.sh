ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/msp/tlscacerts/tlsca.unir.com-cert.pem
CORE_PEER_LOCALMSPID="org1MSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/peers/peer0.org1.unir.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/users/Admin@org1.unir.com/msp
CORE_PEER_ADDRESS=peer0.org1.unir.com:7051
CORE_PEER_ADDRESS2=peer0.org2.unir.com:8051
CORE_PEER_TLS_ROOTCERT_FILE2=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.unir.com/peers/peer0.org2.unir.com/tls/ca.crt

CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true
CORE_PEER_TLS_CLIENTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/tls/server.crt
CORE_PEER_TLS_CLIENTKEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/tls/server.key
CC_PACKAGE_ID=chaincode_1:ceaf27f67763d8989d8d3b0498c79bb27084387df5929ef2d788bd4aa6b642d3
	# while 'peer chaincode' command can get the orderer endpoint from the peer (if join was successful),
	# lets supply it directly as we know it using the "-o" option



peer chaincode invoke -o orderer0.unir.com:7050  --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n chaincode --peerAddresses $CORE_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE --peerAddresses $CORE_PEER_ADDRESS2 --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE2 -c '{"Args":["set","a", "100"]}' --waitForEvent --clientauth --certfile $CORE_PEER_TLS_CLIENTCERT_FILE --keyfile $CORE_PEER_TLS_CLIENTKEY_FILE >&log.txt 
cat log.txt