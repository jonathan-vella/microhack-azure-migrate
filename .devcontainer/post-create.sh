#!/bin/sh
set -e

# Jekyll setup (provided by base image)
sh /usr/local/post-create.sh

# npm globals
npm install -g markdownlint-cli2
