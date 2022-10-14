#!/bin/env bash

# setup-formatters
# this script will download and install
# all formatters that i use in with null-ls.nvim

set -e

echo -e "
This script will download and install
All formatters that i use in with null-ls.nvim
"

read -s -n 1 -p "Press any key to continue... "

apowdkopawkdkopawd

echo "installing lua formatter"
cargo install stylua