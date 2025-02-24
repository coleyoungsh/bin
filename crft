#!/bin/sh

AUTH_USER="cole@young.sh"
INSTANCE_DIR="$XDG_DATA_HOME/mc/instances"
INSTANCE=$(ls $INSTANCE_DIR | tofi --prompt-text "crft:")

mkdir -p $INSTANCE_DIR

[[ ! -z $INSTANCE ]] && case "$INSTANCE" in
  "vanilla") portablemc --output human-color --main-dir $INSTANCE_DIR/$INSTANCE --work-dir $INSTANCE_DIR/$INSTANCE start fabric:1.21 -l $AUTH_USER ;;
  "meteor") portablemc --output human-color --main-dir $INSTANCE_DIR/$INSTANCE --work-dir $INSTANCE_DIR/$INSTANCE start fabric:1.21 -l $AUTH_USER ;;
  *) portablemc --output human-color --main-dir $INSTANCE_DIR/$INSTANCE --work-dir $INSTANCE_DIR/$INSTANCE start fabric: -l $AUTH_USER ;;
esac

