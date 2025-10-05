#!/bin/bash

# Script to download summoner spell icons from Community Dragon CDN

set -e

BASE_URL="https://raw.communitydragon.org/latest/game/data/spells/icons2d"
OUTPUT_DIR="../summoner-spells"

# List of summoner spell icons to download
# Format: "source_filename:destination_filename" or just "filename" to use same name
SUMMONER_SPELLS=(
    "summonerbarrier.png:barrier.png"
    "summoner_boost.png:cleanse.png"
    "summoner_exhaust.png:exhaust.png"
    "summoner_flash.png:flash.png"
    "summoner_haste.png:ghost.png"
    "summoner_heal.png:heal.png"
    "summonerignite.png:ignite.png"
    "summoner_smite.png:smite.png"
    "summoner_mark.png:snowball.png"
    "summoner_teleport_new.png:teleport.png"
    "unleashed_teleport_new.png:unleashed_teleport.png"
)

echo "Creating output directory: $OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

echo "Downloading summoner spell icons..."

# Download each summoner spell icon
for spell_entry in "${SUMMONER_SPELLS[@]}"; do
    # Check if entry contains a colon (source:destination format)
    if [[ "$spell_entry" == *":"* ]]; then
        source_file="${spell_entry%%:*}"
        dest_file="${spell_entry##*:}"
    else
        source_file="$spell_entry"
        dest_file="$spell_entry"
    fi

    echo "Downloading $source_file -> $dest_file..."
    if curl -s -f "$BASE_URL/$source_file" -o "$OUTPUT_DIR/$dest_file"; then
        echo "  ✓ Successfully downloaded $source_file as $dest_file"
    else
        echo "  ✗ Failed to download $source_file"
        exit 1
    fi
done

echo ""
echo "All summoner spell icons downloaded to $OUTPUT_DIR"
echo "Downloaded files:"
ls -la "$OUTPUT_DIR"
