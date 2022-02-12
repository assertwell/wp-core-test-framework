#!/usr/bin/env bash
#
# Refreshes the bin/install-wp-tests.sh file from source, injecting a comment at the top of the file.

upstream_src='https://raw.githubusercontent.com/wp-cli/scaffold-command/master/templates/install-wp-tests.sh'
bin_dir="$(dirname "${BASH_SOURCE[0]}")"

curl -s "$upstream_src" | sed "2i\\
# Notice: This file is pulled from the WP-CLI scaffold command, and should not be modified directly.\\
#\\
# ${upstream_src}
" > "${bin_dir}/install-wp-tests.sh" || exit 1

printf "\033[0;32m%s %s\033[0;32m\n" 'bin/install-wp-tests.sh has been updated to match' "$upstream_src"
