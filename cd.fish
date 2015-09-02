function cd
  # use default fish 'cd' function
  source /usr/local/share/fish/functions/cd.fish
  cd $argv
  # update (Neo)vims current directory to match shell
  if test $VIM
    nvimex "cd " (pwd)
  end
  # reset 'cd' function to this 
  source ~/.config/fish/functions/cd.fish
end
