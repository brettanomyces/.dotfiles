function fkill
  ps -eo pid,comm,cmd | fzf --extended-exact | awk '{print $1}' | xargs kill $argv
end
