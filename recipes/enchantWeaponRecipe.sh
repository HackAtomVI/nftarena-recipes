#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4

WIELDY="wieldy"
SHARP="sharp"
LIGHT="light"
OVERSIZED="oversized"
HEALTHY="healthy"

#sword is used as a dummy-parameter tor prevent IndexOutOfBoundsError in itemOutputs
SWORD_ID="sword"
SWORD=`cat ./items/$SWORD_ID.json`

pylonsd tx pylons create-recipe $GAME_NAME enchantweapon enchantweapon "enchant a weapon with a random enchantment" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[{"ID":"weapon","doubles":[],"longs":[],"strings":[],"conditions":{"doubles":[],"longs":[],"strings":[{"key":"ItemType","value":"weapon"},{"key":"Enchantment","value":"none"}]}}]' '{"coinOutputs": [],"itemOutputs": ['$SWORD'],"itemModifyOutputs":[{"ID":"'$WIELDY'","itemInputRef":"weapon","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$WIELDY'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true},{"ID":"'$SHARP'","itemInputRef":"weapon","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$SHARP'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true},{"ID":"'$LIGHT'","itemInputRef":"weapon","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$LIGHT'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true},{"ID":"'$OVERSIZED'","itemInputRef":"weapon","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$OVERSIZED'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true},{"ID":"'$HEALTHY'","itemInputRef":"weapon","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$HEALTHY'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true}]}' '[{"entryIDs": ["'$WIELDY'"],"weight": 1},{"entryIDs": ["'$SHARP'"],"weight": 1},{"entryIDs": ["'$LIGHT'"],"weight": 1},{"entryIDs": ["'$OVERSIZED'"],"weight": 1},{"entryIDs": ["'$HEALTHY'"],"weight": 1}]' 1 true "" --from $ACC_NAME