function fd
  if count $argv > /dev/null
    # fish arrays start at 1
    set dir $argv[1]
  else
    set dir (pwd)
  end
  set tmpFile /tmp/fd.tmp
  find -L $dir -regex '.*/\.\(git\|svn\).*' -prune -o  -maxdepth 5 -type d -print ^/dev/null | fzf > $tmpFile
  and evalh "cd" (cat $tmpFile)
  rm $tmpFile
end
