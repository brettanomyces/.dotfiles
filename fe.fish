# fuzzy find file and open it in Neovim
function fe
  if count $argv > /dev/null
    # fish arrays start at 1
    set dir $argv[1]
  else
    set dir '.'
  end
  find $dir -regex '.*/\.\(git\|svn\).*' -prune -o \
    -maxdepth 15 -type f -print 2> /dev/null | fzf > /tmp/tmp ; and nvim (cat /tmp/tmp)
end
  
  
  
  
  
  
  
