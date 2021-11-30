#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4
COSTPERBLOCK=$5

NFT_ID="nft"

NFT=`cat ./items/$NFT_ID.json`

pylonsd tx pylons create-recipe $GAME_NAME importnft importnft "import a nft and link it to the ID" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[]' '{"coinOutputs": [],"itemOutputs": ['$NFT'],"itemModifyOutputs":[]}' '[{"entryIDs": ["'$NFT_ID'"],"weight": 1}]' 1 $COSTPERBLOCK true "" --from $ACC_NAME