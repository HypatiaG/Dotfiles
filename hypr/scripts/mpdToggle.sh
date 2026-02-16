#!/bin/bash

# Capture output of a command
mapfile -t lines < <(mpc outputs)

line="${lines[0]}"

if [[ "$line" == *enabled* ]]; then
  mpc enable "pipewire" && mpc disable "HIFI alsa"
  notify-send "MPC" "Pipewire ON"
else
  mpc disable "pipewire" && mpc enable "HIFI alsa"
  notify-send "MPC" "alsa HIFI ON"
fi
