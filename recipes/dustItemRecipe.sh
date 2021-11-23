#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4

pylonsd tx pylons create-recipe $GAME_NAME dustitem dustitem "smash an item to dust" $VERSION '[]' '[{"ID":"item","doubles":[],"longs":[],"strings":[],"conditions":{"doubles":[],"longs":[],"strings":[]}}]' '{"coinOutputs": [{"ID": "dust","coin":{"denom": "'$TOKEN_NAME_EXT'","amount": "10"}}],"itemOutputs": [],"itemModifyOutputs":[]}' '[{"entryIDs": ["dust"],"weight": 1}]' 1 true "" --from $ACC_NAME