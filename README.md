# nftarena-recipes

This repository contains all recipes need for creating the game "NFTArena" on the pylons chain.
It also includes all jsons(items and enchantments) used for building the recipes.
The recipes will be created using the pylonsd-cli so you need access to the node running the chain.

## Setup

### Setup chain
1. Clone the pylons repo `git clone git@github.com:Pylons-tech/pylons.git`
2. Checkout the branch containing the battle transaction `git checkout origin/hackatom-cc`
3. Start the blockchain `starport chain serve`

### Setup recipes
4. Clone this repo in another folder `git@github.com:HackAtomVI/nftarena-recipes.git`
5. Execute `sh setup.sh` in this folder and confirm every transaction popping up

### Set test user
6. Execute `sh setupTestUser.sh` in this folder and confirm every transaction popping up
