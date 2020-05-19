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
export CC_PACKAGE_ID="identitycc:cfca5eed9403de3514cef7bb4fe9f2c65548a304bc5a1b8ad63405e1143be199"
	# while 'peer chaincode' command can get the orderer endpoint from the peer (if join was successful),
	# lets supply it directly as we know it using the "-o" option

ARGS="{\"did\":\"did:vtn:trustos:telefonica:0\",\"controller\":\"did:vtn:trustos:telefonica:0\",\"publicKey\":\"-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7NBDzVMESXU\/yuARe7YU\nGrkgNMZh5eA5w3PgxgYZf\/isDLPHvmSM2Q9cTauDroriGInikQxtZ\/CI4+9Qi4Rd\nJCHjeWhzw0hTIXhHoohyo9QTbUVetb4RBDJEcNqFrpztAojn8Ib5EF2soBFtBLyT\nguxlizcWwTZvv+KxHGBg\/tUE7JIqw3YzmEK31faR2HhkPPqxTQ9F+h4SOnY9e6Cf\nh75PpjouzarpntSVkAqv\/Ot5kV3O4TcWhB0vUr\/HZwx2iX+LEyYock8Sx4Op20\/g\n7k3J3rYhMGTHfkKMhZjX9QoZ8uBRiSxieAaia0yZSIcycgE6Aqu6KT+WaQn4bCnh\nwQIDAQAB\n-----END PUBLIC KEY-----\"}"

peer chaincode invoke -o orderer0.unir.com:7050 --isInit --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n identitycc --peerAddresses $CORE_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE -c '{"Args":["Init", "{\"did\":\"did:vtn:trustos:telefonica:0\",\"controller\":\"did:vtn:trustos:telefonica:0\",\"publicKey\":\"-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7NBDzVMESXU\/yuARe7YU\nGrkgNMZh5eA5w3PgxgYZf\/isDLPHvmSM2Q9cTauDroriGInikQxtZ\/CI4+9Qi4Rd\nJCHjeWhzw0hTIXhHoohyo9QTbUVetb4RBDJEcNqFrpztAojn8Ib5EF2soBFtBLyT\nguxlizcWwTZvv+KxHGBg\/tUE7JIqw3YzmEK31faR2HhkPPqxTQ9F+h4SOnY9e6Cf\nh75PpjouzarpntSVkAqv\/Ot5kV3O4TcWhB0vUr\/HZwx2iX+LEyYock8Sx4Op20\/g\n7k3J3rYhMGTHfkKMhZjX9QoZ8uBRiSxieAaia0yZSIcycgE6Aqu6KT+WaQn4bCnh\nwQIDAQAB\n-----END PUBLIC KEY-----\"}"]}' --waitForEvent >&log.txt 
cat log.txt


export CC_PACKAGE_ID="chaincode_1:1dc2e9e9d4f7f75ccd974156a0fd978ce77ca1737ac58b249d8b47e72e1267f8"
peer chaincode invoke -o orderer0.unir.com:7050 --isInit --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n chaincode --peerAddresses $CORE_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE -c '{"Args":["Init","a"]}' --waitForEvent >&log.txt 
cat log.txt