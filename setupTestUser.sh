#!/bin/sh
GAME_NAME="nftarena"
USR_NAME="patrick"


#create key
pylonsd keys add $USR_NAME

#read key
KEY=$(pylonsd keys show $USR_NAME --address)

#create account
pylonsd tx pylons create-account $USR_NAME --from $KEY

#get pylons
curl -X POST "0.0.0.0:4500/" -H "accept:application/json" -H "Content-Type:application/json" -d "{\"address\":\"$KEY\",\"coins\":[\"10000upylon\"]}"

#get coins
pylonsd tx pylons execute-recipe $GAME_NAME getcoins 0 '[]' '[]' --from $USR_NAME

#mint a weapon
pylonsd tx pylons execute-recipe $GAME_NAME mintweapon 0 '[]' '[]' --from $USR_NAME

#mint an armor
pylonsd tx pylons execute-recipe $GAME_NAME mintarmor 0 '[]' '[]' --from $USR_NAME

#mint a shield
pylonsd tx pylons execute-recipe $GAME_NAME mintshield 0 '[]' '[]' --from $USR_NAME

#import a nft
pylonsd tx pylons execute-recipe $GAME_NAME importnft 0 '[]' '[]' --from $USR_NAME


echo $KEY