ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/msp/tlscacerts/tlsca.unir.com-cert.pem
CORE_PEER_LOCALMSPID="org2MSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.unir.com/peers/peer0.org2.unir.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.unir.com/users/Admin@org2.unir.com/msp
CORE_PEER_ADDRESS=peer0.org2.unir.com:8051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true

cd $GOPATH/src/github.com/hyperledger/fabric/examples/chaincode/go/sacc
GO111MODULE=on go mod vendor
cd -
peer lifecycle chaincode install chaincode.tar.gz >&log.txt
cat log.txt

ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/msp/tlscacerts/tlsca.unir.com-cert.pem
CORE_PEER_LOCALMSPID="org2MSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.unir.com/peers/peer0.org2.unir.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.unir.com/users/Admin@org2.unir.com/msp
CORE_PEER_ADDRESS=peer1.org2.unir.com:6051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true

CORE_PEER_TLS_CLIENTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/users/Admin@org1.unir.com/tls/client.crt
CORE_PEER_TLS_CLIENTKEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/users/Admin@org1.unir.com/tls/client.key
peer lifecycle chaincode install chaincode.tar.gz >&log.txt
cat log.txt
