#!/bin/sh
printf '\033c\033]0;%s\a' Opus_1_No_6
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Opus_1_No_6.x86_64" "$@"
