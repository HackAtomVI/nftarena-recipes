#!/bin/sh
GAME_NAME="nftarena"
DEV_NAME="marius"
DEV_MAIL="sample@gmail.com"

TOKEN_NAME="coin"
TOKEN_NAME_EXT=$GAME_NAME"/"$TOKEN_NAME
VERSION="v1.0.0"



#create cookbook
pylonsd tx pylons create-cookbook $GAME_NAME $GAME_NAME "A place for NFTs to fight" $DEV_NAME $VERSION $DEV_MAIL "{\"denom\":\"$TOKEN_NAME\",\"amount\":\"50\"}" true --from $DEV_NAME

#create faucet
pylonsd tx pylons create-recipe $GAME_NAME getcoin getcoin "Get some coins to test" $VERSION '[]' '[]' '{"coinOutputs": [{"ID":"coinShower",  "coin":{"denom":'$TOKEN_NAME',"amount": "100000"}}], "itemOutputs": [],"itemModifyOutputs":[]}' '[{"entryIDs": ["coinShower"],"weight": 1}]' 1 true "" --from $DEV_NAME

#create mintweapon
sh ./recipes/mintWeaponRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT

#create enchantWeapon
sh ./recipes/enchantWeaponRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT
