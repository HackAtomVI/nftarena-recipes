#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4
COSTPERBLOCK=$5

WIELDY_ID="wieldy"
SHARP_ID="sharp"
LIGHT_ID="light"
OVERSIZED_ID="oversized"

WIELDY=`cat ./enchantments/$WIELDY_ID.json`
SHARP=`cat ./enchantments/$SHARP_ID.json`
LIGHT=`cat ./enchantments/$LIGHT_ID.json`
OVERSIZED=`cat ./enchantments/$OVERSIZED_ID.json`

pylonsd tx pylons create-recipe $GAME_NAME enchantweapon enchantweapon "enchant a weapon with a random enchantment" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[{"ID":"weapon","doubles":[{"key":"damage","minValue":"0","maxValue":"100"},{"key":"accuracy","minValue":"0","maxValue":"10"}],"longs":[],"strings":[],"conditions":{"doubles":[],"longs":[],"strings":[{"key":"ItemType","value":"weapon"},{"key":"Enchantment","value":"none"}]}}]' '{"coinOutputs": [],"itemOutputs": [],"itemModifyOutputs":['$WIELDY','$SHARP','$LIGHT','$OVERSIZED']}' '[{"entryIDs": ["'$WIELDY_ID'"],"weight": 1},{"entryIDs": ["'$SHARP_ID'"],"weight": 1},{"entryIDs": ["'$LIGHT_ID'"],"weight": 1},{"entryIDs": ["'$OVERSIZED_ID'"],"weight": 1}]' 1 $COSTPERBLOCK true "" --from $ACC_NAME