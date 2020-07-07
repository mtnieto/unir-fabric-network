ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/unir.com/orderers/orderer0.unir.com/msp/tlscacerts/tlsca.unir.com-cert.pem
CORE_PEER_LOCALMSPID="org1MSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/peers/peer0.org1.unir.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.unir.com/users/Admin@org1.unir.com/msp
CORE_PEER_ADDRESS=peer0.org1.unir.com:7051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true

export CC_PACKAGE_ID="cc:d1c4fb58cfbba0947fe1ed16877fd94f96c10e9b107cfbaacf1e4f3a19d42e1b"

peer chaincode query -o orderer0.unir.com:7050  --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n cc --peerAddresses $CORE_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE  -c '{"Args":["get","hola"]}'  >&log.txt 
cat log.txt