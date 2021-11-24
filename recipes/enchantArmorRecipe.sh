#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4

TOUGH="tough"
HARDENED="hardened"
UNDERLAID="underlaid"
FORTIFIED="fortified"
HEALTHY="healthy"

#sword is used as a dummy-parameter tor prevent IndexOutOfBoundsError in itemOutputs
SWORD_ID="sword"
SWORD=`cat ./items/$SWORD_ID.json`

pylonsd tx pylons create-recipe $GAME_NAME enchantarmor enchantarmor "enchant a armor with a random enchantment" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[{"ID":"armor","doubles":[],"longs":[],"strings":[],"conditions":{"doubles":[],"longs":[],"strings":[{"key":"ItemType","value":"armor"},{"key":"Enchantment","value":"none"}]}}]' '{"coinOutputs": [],"itemOutputs": ['$SWORD'],"itemModifyOutputs":[{"ID":"'$TOUGH'","itemInputRef":"armor","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$TOUGH'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true},{"ID":"'$FORTIFIED'","itemInputRef":"armor","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$FORTIFIED'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true},{"ID":"'$HARDENED'","itemInputRef":"armor","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$HARDENED'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true},{"ID":"'$UNDERLAID'","itemInputRef":"armor","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$UNDERLAID'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true},{"ID":"'$HEALTHY'","itemInputRef":"armor","doubles":[],"longs":[],"strings":[{"key":"Enchantment","value":"'$HEALTHY'"}],"mutableStrings":[],"transferFee":[],"tradePercentage":"0.100000000000000000","tradeable":true}]}' '[{"entryIDs": ["'$TOUGH'"],"weight": 1},{"entryIDs": ["'$FORTIFIED'"],"weight": 1},{"entryIDs": ["'$HARDENED'"],"weight": 1},{"entryIDs": ["'$UNDERLAID'"],"weight": 1},{"entryIDs": ["'$HEALTHY'"],"weight": 1}]' 1 true "" --from $ACC_NAME