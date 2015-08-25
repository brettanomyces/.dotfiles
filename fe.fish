# fuzzy find file and open it in Neovim
function fe
  if count $argv > /dev/null
    # fish arrays start at 1
    set dir $argv[1]
  else
    set dir (pwd)
  end
  set tmpFile /tmp/fe.tmp
  find -L $dir -regex '.*/\.\(git\|svn\).*' -prune -o  -maxdepth 15 -type f -print ^/dev/null | fzf > $tmpFile 
  and evalh $EDITOR (cat $tmpFile)
  rm $tmpFile
end
  
  
  
  
  
  
  
