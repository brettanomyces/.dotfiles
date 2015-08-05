function edit_command
  set tmpFile /tmp/edit_command.tmp
  commandline > $tmpFile
  eval $EDITOR $tmpFile
  commandline -r (cat $tmpFile)
  rm $tmpFile
end
