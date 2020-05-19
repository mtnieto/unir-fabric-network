export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/msp/tlscacerts/tlsca.unir.com-cert.pem
export CORE_PEER_LOCALMSPID="org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/peers/peer0.org1.unir.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/users/Admin@org1.unir.com/msp
export CORE_PEER_ADDRESS=peer0.org1.unir.com:7051
export CHANNEL_NAME=channel1
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_CLIENTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/tls/server.crt
export CORE_PEER_TLS_CLIENTKEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/tls/server.key
export CC_PACKAGE_ID="identitycc:cfca5eed9403de3514cef7bb4fe9f2c65548a304bc5a1b8ad63405e1143be199"
export ORDERER_URL=orderer0.unir.com:7050


export ORDERER_URL=orderer0.unir.com:7050
peer lifecycle chaincode commit -o orderer0.unir.com:7050 --channelID $CHANNEL_NAME --name identitycc --version 1.0 --sequence 1 --init-required --tls true --cafile $ORDERER_CA --peerAddresses peer0.org1.unir.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/peers/peer0.org1.unir.com/tls/ca.crt   >&log.txt

cat log.txt
#--peerAddresses peer0.org2.unir.com:8051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.unir.com/peers/peer0.org2.unir.com/tls/ca.crt 
sleep 5
export CC_PACKAGE_ID="chaincode_1:1dc2e9e9d4f7f75ccd974156a0fd978ce77ca1737ac58b249d8b47e72e1267f8"
peer lifecycle chaincode commit -o orderer0.unir.com:7050 --channelID $CHANNEL_NAME --name chaincode --version 1.0 --sequence 1 --init-required --tls true --cafile $ORDERER_CA --peerAddresses peer0.org1.unir.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/peers/peer0.org1.unir.com/tls/ca.crt   >&log.txt
