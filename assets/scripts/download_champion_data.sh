#!/bin/bash

# Script to download all League of Legends champion information from CommunityDragon (requires wget)

# -r Recursively download
# -np no parent (do not follow links to parent dir)
# -nd no directory (do not put files in their raw/latest/.../1.json directory)
# -P prefix directory (put downloaded files here)
# -N do not re-retrieve files unless newer than local
# -R reject files following pattern "index.html*"
wget -r -np -nd -P "../champions/data/" -N -R "index.html*" https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champions/
