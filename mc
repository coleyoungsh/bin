#!/bin/sh

AUTH_USER="cole@young.sh"
INSTANCE_DIR="$XDG_DATA_HOME/mc/"

# todo: version management

case "$1" in
  "-a") 
    printf "[create new instance]\nname: " && read name
    [[ ! -z name ]] && mkdir -p $INSTANCE_DIR/$name
    portablemc --output human-color --main-dir $INSTANCE_DIR/$name --work-dir $INSTANCE_DIR/$name login $AUTH_USER --auth-no-browser
    mkdir -p $INSTANCE_DIR/$name/mods
    ferium profile create
    exit 0
  ;;
esac


INSTANCE=$(ls $INSTANCE_DIR | tofi --prompt-text "󰍳 Minecraft: ")

mkdir -p $INSTANCE_DIR

[[ ! -z $INSTANCE ]] && case "$INSTANCE" in
  "vanilla") portablemc --output human-color --main-dir $INSTANCE_DIR/$INSTANCE --work-dir $INSTANCE_DIR/$INSTANCE start fabric:1.21 -l $AUTH_USER --auth-no-browser;;
  "meteor") portablemc --output human-color --main-dir $INSTANCE_DIR/$INSTANCE --work-dir $INSTANCE_DIR/$INSTANCE start fabric:1.21 -l $AUTH_USER --auth-no-browser;;
  *) portablemc --output human-color --main-dir $INSTANCE_DIR/$INSTANCE --work-dir $INSTANCE_DIR/$INSTANCE start fabric: -l $AUTH_USER --auth-no-browser;;
esac

