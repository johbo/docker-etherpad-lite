#!/bin/bash

SETTINGS_FILE=/data/etherpad-settings.json
SETTINGS_SOURCE=/src/etherpad/bin/generate-settings.sh


# Check if the settings have to be created
if [ ! -f $SETTINGS_FILE ]
then
    echo "Generating settings file ${SETTINGS_FILE}"
    bash $SETTINGS_SOURCE > $SETTINGS_FILE
fi

# Copy setting into the root of the installation, seems to be
# required due to Settings.js
cp $SETTINGS_FILE settings.json

bin/run.sh --root
