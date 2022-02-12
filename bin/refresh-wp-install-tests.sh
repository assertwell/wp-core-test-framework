#!/usr/bin/env bash
#
# Refreshes the bin/install-wp-tests.sh file from source, injecting a comment at the top of the file.

SRC="https://raw.githubusercontent.com/wp-cli/scaffold-command/master/templates/install-wp-tests.sh"
DIR="$(cd "$(dirname "$0")" || exit 1; pwd -P)"

curl -s "$SRC" \
    | sed -e '2 i # Notice: This file is pulled from the WP-CLI scaffold command,\n# and should not be modified directly.' \
    > "${DIR}/install-wp-tests.sh" \
    && printf '\033[0;32m%s %s\033[0;0m\n' "bin/install-wp-tests.sh has been updated to match" "${SRC}"
