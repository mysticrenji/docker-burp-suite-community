#!/usr/bin/env sh

PROJECT_CONFIG="$HOME/config/project_options.json"
USER_CONFIG="$HOME/config/user_options.json"

set -e

exec java -jar "$@" --config-file="$PROJECT_CONFIG" --user-config-file="$USER_CONFIG"
