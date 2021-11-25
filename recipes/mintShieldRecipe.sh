#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4

ROUNDSHIELD_ID="roundShield"
KITESHIELD_ID="kiteShield"
HEATERSHIELD_ID="heaterShield"
TOWERSHIELD_ID="towerShield"

ROUNDSHIELD=`cat ./items/$ROUNDSHIELD_ID.json`
KITESHIELD=`cat ./items/$KITESHIELD_ID.json`
HEATERSHIELD=`cat ./items/$HEATERSHIELD_ID.json`
TOWERSHIELD=`cat ./items/$TOWERSHIELD_ID.json`

pylonsd tx pylons create-recipe $GAME_NAME mintshield mintshield "mint a random shield" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[]' '{"coinOutputs": [],"itemOutputs": ['$ROUNDSHIELD','$KITESHIELD','$HEATERSHIELD','$TOWERSHIELD'],"itemModifyOutputs":[]}' '[{"entryIDs": ["'$ROUNDSHIELD_ID'"],"weight": 1},{"entryIDs": ["'$KITESHIELD_ID'"],"weight": 1},{"entryIDs": ["'$HEATERSHIELD_ID'"],"weight": 1},{"entryIDs": ["'$TOWERSHIELD_ID'"],"weight": 1}]' 1 true "" --from $ACC_NAME