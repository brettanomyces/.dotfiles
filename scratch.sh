#!/usr/bin/env bash

# Move all files in the current directory to a subfolder. Useful to clean up scratch directories such as ~/Downloads.

cwd=$(pwd)
dir=$(date -u +"%Y%m%d")"_scratch"

read -p "Are you sure you want to scratch ""$cwd""? All contents will be moved to ""$cwd""/""$dir"". [y/n]: " -r

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	exit
fi

mkdir -p "$dir"

find . \
	-maxdepth 1 \
	-mindepth 1 \
	-type d \
	-regextype egrep \
	-regex ".*[0-9]{8}_scratch" \
	-prune \
	-o \
	-print0 \
	| xargs -0 -r mv -t "$dir"
