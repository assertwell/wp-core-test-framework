#!/usr/bin/env bash
#
# Refreshes the bin/install-wp-tests.sh file from source, injecting a comment at the top of the file.

SRC="https://raw.githubusercontent.com/wp-cli/scaffold-command/master/templates/install-wp-tests.sh"
DIR="$( cd "$(dirname "$0")" || exit 1; pwd -P )"

curl -s "$SRC" \
    | sed $'2i\\\n# Notice: This file is pulled from the WP-CLI scaffold command,\\\n# and should not be modified directly.\n' \
    > "$DIR/install-wp-tests.sh" \
    && echo "\033[0;32mbin/install-wp-tests.sh has been updated to match ${SRC}\033[0;0m"
