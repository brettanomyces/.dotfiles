#!/usr/bin/env bash

find "/media/yukichb/work/" -type f -name "*""$1""*" | fzf | xargs --no-run-if-empty "$EDITOR"

# alternative solution that does not rely on fzf or xargs
# select script in $(find "/media/yukichb/work" -type f -name "*""$1""*")
# 	do "$EDITOR" "$script" && break;
# exit;
# done
