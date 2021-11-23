#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4

#sword is used as a dummy-parameter tor prevent IndexOutOfBoundsError in itemOutputs
SWORD_ID="sword"
SWORD=`cat ./items/$SWORD_ID.json`

pylonsd tx pylons create-recipe $GAME_NAME enchantweapon enchantweapon "enchant a weapon with a random enchantment" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[{"ID":"weapon","doubles":[],"longs":[],"strings":[],"conditions":{"doubles":[],"longs":[],"strings":[{"key":"ItemType","value":"weapon"},{"key":"Enchantment","value":"none"}]}}]' '{"coinOutputs": [],"itemOutputs": ['$SWORD'],"itemModifyOutputs":[{"ID":"enchantedWeapon","itemInputRef":"weapon","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"blingbling"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true}]}' '[{"entryIDs": ["enchantedWeapon"],"weight": 1}]' 1 true "" --from $ACC_NAME