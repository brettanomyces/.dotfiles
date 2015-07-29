function fd
  if count $argv > /dev/null
    # fish arrays start at 1
    set fromDir $argv[1]
  else
    set fromDir '.'
  end
  set toDir /tmp/dir
  find $fromDir -regex '.*/\.\(git\|svn\).*' -prune -o \
    -maxdepth 5 -type d -print 2> /dev/null | fzf > $toDir; and cd (cat $toDir)
end
