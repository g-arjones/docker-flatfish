#!/bin/bash

# Set Flatfish's home path here
FLATFISH_PATH="$HOME/workspace/flatfish"

# Don't change these unless you know what you are doing
USER="$(id -nu)"
UUID="$(id -u)"
UGID="$(id -g)"

export FLATFISH_PATH
export UUID
export UGID
