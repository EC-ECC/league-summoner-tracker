#!/bin/bash

# Script to download all League of Legends champion icons from CommunityDragon

BASE_URL="https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/"

mkdir -p champions
cd champions

# Parse PNG filenames from table rows
champion_files=$(curl -s "${BASE_URL}" | grep -o '<a href="[^"]*\.png"' | sed 's/<a href="//g' | sed 's/"//g' | grep -v '^\.\./$')

champion_ids=($(echo "$champion_files" | sed 's/\.png$//g'))

# Progress counter
total=${#champion_ids[@]}
current=0

echo "Found ${total} champion icons to download..."
echo "Starting download..."

# Download each champion icon
for champion_id in "${champion_ids[@]}"; do
    current=$((current + 1))
    filename="${champion_id}.png"
    url="${BASE_URL}${filename}"  # e.g. https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/1.png

    echo "[${current}/${total}] Downloading ${filename}..."

    # curl, show progress, and handle errors
    if curl -L -o "${filename}" "${url}" 2>/dev/null; then
        echo "✓ Successfully downloaded ${filename}"
    else
        echo "✗ Failed to download ${filename}"
    fi
done

echo ""
echo "Download complete! Downloaded ${total} champion icons to assets/champions/"
echo "Files saved in: $(pwd)"
