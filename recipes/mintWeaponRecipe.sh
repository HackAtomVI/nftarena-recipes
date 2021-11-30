#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4
COSTPERBLOCK=$5

SWORD_ID="sword"
GREATSWORD_ID="greatSword"
AXE_ID="axe"

SWORD=`cat ./items/$SWORD_ID.json`
GREATSWORD=`cat ./items/$GREATSWORD_ID.json`
AXE=`cat ./items/$AXE_ID.json`

pylonsd tx pylons create-recipe $GAME_NAME mintweapon mintweapon "mint a random weapon" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[]' '{"coinOutputs": [],"itemOutputs": ['$SWORD','$GREATSWORD','$AXE'],"itemModifyOutputs":[]}' '[{"entryIDs": ["'$AXE_ID'"],"weight": 1},{"entryIDs": ["'$SWORD_ID'"],"weight": 1},{"entryIDs": ["'$GREATSWORD_ID'"],"weight": 1}]' 1 $COSTPERBLOCK true "" --from $ACC_NAME