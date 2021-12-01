#!/bin/sh
GAME_NAME="nftarena"
DEV_NAME="marius"
DEV_MAIL="sample@gmail.com"

TOKEN_NAME="coin"
TOKEN_NAME_EXT=$GAME_NAME"/"$TOKEN_NAME
VERSION="v1.0.0"
COSTPERBLOCK="{\"denom\":\"$TOKEN_NAME\",\"amount\":\"50\"}"


#create key
pylonsd keys add $DEV_NAME

#read key
KEY=$(pylonsd keys show $DEV_NAME --address)

#create account
pylonsd tx pylons create-account $DEV_NAME --from $KEY

sleep 5

#create cookbook
pylonsd tx pylons create-cookbook $GAME_NAME $GAME_NAME "A place for NFTs to fight" $DEV_NAME $VERSION $DEV_MAIL true --from $DEV_NAME

#create faucet
pylonsd tx pylons create-recipe $GAME_NAME getcoins getcoins "Get some coins to test" $VERSION '[]' '[]' '{"coinOutputs": [{"ID":"coinShower",  "coin":{"denom":"'$TOKEN_NAME'","amount": "100000"}}], "itemOutputs": [],"itemModifyOutputs":[]}' '[{"entryIDs": ["coinShower"],"weight": 1}]' 1 $COSTPERBLOCK true "" --from $DEV_NAME

#create mintweapon
sh ./recipes/mintWeaponRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT $COSTPERBLOCK

#create enchantWeapon
sh ./recipes/enchantWeaponRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT $COSTPERBLOCK

#create mintArmor
sh ./recipes/mintArmorRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT $COSTPERBLOCK

#create enchantArmor
sh ./recipes/enchantArmorRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT $COSTPERBLOCK

#create mintShield
sh ./recipes/mintShieldRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT $COSTPERBLOCK

#create enchantShield
sh ./recipes/enchantShieldRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT $COSTPERBLOCK

#create dustItem
sh ./recipes/dustItemRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT $COSTPERBLOCK

#import nft
sh ./recipes/importNFTRecipe.sh $GAME_NAME $VERSION $DEV_NAME $TOKEN_NAME_EXT $COSTPERBLOCK

echo $KEY
