#!/bin/sh
GAME_NAME="nftarena"
USR_NAME="patrick"


#create key
pylonsd keys add $USR_NAME

#read key
KEY=$(pylonsd keys show $USR_NAME --address)

#create account
pylonsd tx pylons create-account $USR_NAME --from $KEY

#get coins
pylonsd tx pylons execute-recipe $GAME_NAME getcoins 0 '[]' '[]' --from $USR_NAME

#mint a weapon
pylonsd tx pylons execute-recipe nftarena mintweapon 0 '[]' '[]' --from $USR_NAME

#mint an armor
pylonsd tx pylons execute-recipe nftarena mintarmor 0 '[]' '[]' --from $USR_NAME

#mint a sield
pylonsd tx pylons execute-recipe nftarena mintshield 0 '[]' '[]' --from $USR_NAME


echo $KEY