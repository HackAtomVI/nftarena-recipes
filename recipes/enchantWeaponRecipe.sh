#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4

pylonsd tx pylons create-recipe $GAME_NAME enchantweapon enchantweapon "enchant a weapon with a random enchantment" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[{"ID":"weapon","doubles":[],"longs":[],"strings":[{"key":"ItemType","value":"weapon"}],"conditions":{"doubles":[],"longs":[],"strings":[]}}]' '{"coinOutputs": [],"itemOutputs": [],"itemModifyOutputs":[{"ID":"enchantedWeapon","itemInputRef":"weapon","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"blingbling"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true}]}' '[{"entryIDs": ["enchantedWeapon"],"weight": 1}]' 1 true "" --from $ACC_NAME