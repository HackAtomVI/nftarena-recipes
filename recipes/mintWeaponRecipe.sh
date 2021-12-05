#!/bin/sh

GAME_NAME=$1
VERSION=$2
ACC_NAME=$3
TOKEN_NAME_EXT=$4
COSTPERBLOCK=$5

SWORD_ID="sword"
GREATSWORD_ID="greatSword"
BOW_ID="bow"
CROSSBOW_ID="crossbow"
DAGGER_ID="dagger"
FLAIL_ID="flail"
JAVELIN_ID="javelin"
MACE_ID="mace"
MAUL_ID="maul"
POLEAXE_ID="poleAxe"
SPEAR_ID="spear"
AXE_ID="axe"

SWORD=$(<./items/$SWORD_ID.json)
GREATSWORD=$(<./items/$GREATSWORD_ID.json)
BOW=$(<./items/$BOW_ID.json)
CROSSBOW=$(<./items/$CROSSBOW_ID.json)
DAGGER=$(<./items/$DAGGER_ID.json)
FLAIL=$(<./items/$FLAIL_ID.json)
JAVELIN=$(<./items/$JAVELIN_ID.json)
MACE=$(<./items/$MACE_ID.json)
MAUL=$(<./items/$MAUL_ID.json)
POLEAXE=$(<./items/$POLEAXE_ID.json)
SPEAR=$(<./items/$SPEAR_ID.json)
AXE=$(<./items/$AXE_ID.json)


pylonsd tx pylons create-recipe $GAME_NAME mintweapon mintweapon "mint a random weapon" $VERSION '[{"coins": [{"denom": "'$TOKEN_NAME_EXT'", "amount": "100"}]}]' '[]' '{"coinOutputs": [],"itemOutputs": ['"$SWORD"','"$GREATSWORD"','"$AXE"','"$BOW"','"$CROSSBOW"','"$DAGGER"','"$FLAIL"','"$JAVELIN"','"$MACE"','"$MAUL"','"$POLEAXE"','"$SPEAR"'],"itemModifyOutputs":[]}' '[{"entryIDs": ["'$SPEAR_ID'"],"weight": 1},{"entryIDs": ["'$POLEAXE_ID'"],"weight": 1},{"entryIDs": ["'$MAUL_ID'"],"weight": 1},{"entryIDs": ["'$MACE_ID'"],"weight": 1},{"entryIDs": ["'$JAVELIN_ID'"],"weight": 1},{"entryIDs": ["'$FLAIL_ID'"],"weight": 1},{"entryIDs": ["'$DAGGER_ID'"],"weight": 1},{"entryIDs": ["'$CROSSBOW_ID'"],"weight": 1},{"entryIDs": ["'$BOW_ID'"],"weight": 1},{"entryIDs": ["'$AXE_ID'"],"weight": 1},{"entryIDs": ["'$SWORD_ID'"],"weight": 1},{"entryIDs": ["'$GREATSWORD_ID'"],"weight": 1}]' 1 $COSTPERBLOCK true "" --from $ACC_NAME