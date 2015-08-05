function fd
  if count $argv > /dev/null
    # fish arrays start at 1
    set dir $argv[1]
  else
    set dir '.'
  end
  set tmpFile /tmp/fd.tmp
  find $dir -regex '.*/\.\(git\|svn\).*' -prune -o \
    -maxdepth 5 -type d -print 2> /dev/null | fzf > $tmpFile; and cd (cat $tmpFile)
  rm $tmpFile
end
