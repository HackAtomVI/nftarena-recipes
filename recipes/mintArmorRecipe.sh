#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4
COSTPERBLOCK=$5

PADDEDVEST_ID="paddedVest"
GAMBESON_ID="gambeson"
CHAINMAIL_ID="chainmail"
BRIGANDINE_ID="brigandine"
PLATEARMOR_ID="plateArmor"

PADDEDVEST=`cat ./items/$PADDEDVEST_ID.json`
GAMBESON=`cat ./items/$GAMBESON_ID.json`
CHAINMAIL=`cat ./items/$CHAINMAIL_ID.json`
BRIGANDINE=`cat ./items/$BRIGANDINE_ID.json`
PLATEARMOR=`cat ./items/$PLATEARMOR_ID.json`

pylonsd tx pylons create-recipe $GAME_NAME mintarmor mintarmor "mint a random piece of armor" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[]' '{"coinOutputs": [],"itemOutputs": ['$PADDEDVEST','$GAMBESON','$CHAINMAIL','$BRIGANDINE','$PLATEARMOR'],"itemModifyOutputs":[]}' '[{"entryIDs": ["'$PADDEDVEST_ID'"],"weight": 1},{"entryIDs": ["'$GAMBESON_ID'"],"weight": 1},{"entryIDs": ["'$CHAINMAIL_ID'"],"weight": 1},{"entryIDs": ["'$BRIGANDINE_ID'"],"weight": 1},{"entryIDs": ["'$PLATEARMOR_ID'"],"weight": 1}]' 1 $COSTPERBLOCK true "" --from $ACC_NAME