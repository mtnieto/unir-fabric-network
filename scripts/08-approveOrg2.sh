ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/msp/tlscacerts/tlsca.unir.com-cert.pem
CORE_PEER_LOCALMSPID="org2MSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.unir.com/peers/peer0.org2.unir.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.unir.com/users/Admin@org2.unir.com/msp
CORE_PEER_ADDRESS=peer0.org2.unir.com:8051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true
ORDERER_URL=orderer0.unir.com:7050
CORE_PEER_TLS_CLIENTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/tls/server.crt
CORE_PEER_TLS_CLIENTKEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/tls/server.key
export CC_PACKAGE_ID="chaincode_1:1dc2e9e9d4f7f75ccd974156a0fd978ce77ca1737ac58b249d8b47e72e1267f8"

peer lifecycle chaincode approveformyorg -o $ORDERER_URL --ordererTLSHostnameOverride orderer0.unir.com  --channelID $CHANNEL_NAME --name chaincode --version 1.0 --init-required --package-id $CC_PACKAGE_ID --sequence 1 --tls true --cafile $ORDERER_CA >&log.txt

cat log.txt

peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME --name chaincode --version 1.0 --init-required --sequence 1 --tls true --cafile $ORDERER_CA --output json

