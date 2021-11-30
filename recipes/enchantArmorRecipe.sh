#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4
COSTPERBLOCK=$5

TOUGH_ID="tough"
HARDENED_ID="hardened"
UNDERLAID_ID="underlaid"
FORTIFIED_ID="fortified"
HEALTHY_ID="healthy"

TOUGH=`cat ./enchantments/$TOUGH_ID.json`
HARDENED=`cat ./enchantments/$HARDENED_ID.json`
UNDERLAID=`cat ./enchantments/$UNDERLAID_ID.json`
FORTIFIED=`cat ./enchantments/$FORTIFIED_ID.json`
HEALTHY=`cat ./enchantments/$HEALTHY_ID.json`

pylonsd tx pylons create-recipe $GAME_NAME enchantarmor enchantarmor "enchant an armor with a random enchantment" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[{"ID":"armor","doubles":[{"key":"accuracyModifier","minValue":"0","maxValue":"1000"},{"key":"sliceDef","minValue":"0","maxValue":"10"},{"key":"stabDef","minValue":"0","maxValue":"10"},{"key":"bluntDef","minValue":"0","maxValue":"10"},{"key":"boltDef","minValue":"0","maxValue":"10"}],"longs":[],"strings":[],"conditions":{"doubles":[],"longs":[],"strings":[{"key":"ItemType","value":"armor"},{"key":"Enchantment","value":"none"}]}}]' '{"coinOutputs": [],"itemOutputs": [],"itemModifyOutputs":['$TOUGH','$FORTIFIED','$HARDENED','$UNDERLAID','$HEALTHY']}' '[{"entryIDs": ["'$TOUGH_ID'"],"weight": 1},{"entryIDs": ["'$FORTIFIED_ID'"],"weight": 1},{"entryIDs": ["'$HARDENED_ID'"],"weight": 1},{"entryIDs": ["'$UNDERLAID_ID'"],"weight": 1},{"entryIDs": ["'$HEALTHY_ID'"],"weight": 1}]' 1 $COSTPERBLOCK true "" --from $ACC_NAME