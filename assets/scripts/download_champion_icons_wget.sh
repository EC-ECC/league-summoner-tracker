#!/bin/bash
# Script to download all League of Legends champion information from CommunityDragon (requires wget)

# Make sure files get downloaded to correct location, regardless of execution location
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SOURCE="https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/"

# -r Recursively download
# -np no parent (do not follow links to parent dir)
# -nd no directory (do not put files in their raw/latest/.../1.json directory)
# -P prefix directory (put downloaded files here)
# -N do not re-retrieve files unless newer than local
# -R reject files following pattern "index.html*"
wget -r -np -nd -P "${SCRIPT_DIR}/../champions/icons/" -N -R "index.html*" ${SOURCE}
