function fkill
  set tmpFile /tmp/fkill.tmp
  ps h -eo pid,comm,cmd | fzf --extended-exact | awk '{print $1}' > $tmpFile
  if test -s $tmpFile
    evalh "kill" $argv (cat $tmpFile)
  end
  rm $tmpFile
end
