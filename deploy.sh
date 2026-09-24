#!/bin/bash
set -e

source_dir=${1:-site}
target_dir=${2:-/var/www/html}

if [ ! -d "$source_dir" ]; then

    echo "Error: directory $source_dir does not exist."
    exit 1
fi


if [ ! -f "$source_dir/index.html" ]; then
    echo "Error: homepage $source_dir/index.html does not exist."
    exit 1
fi

echo "Deploying $source_dir to $target_dir..."
sudo cp -r "$source_dir"/. "$target_dir"/

echo "Deployment completed."

