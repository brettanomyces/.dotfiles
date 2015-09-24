function edit_command
  set tmpFile /tmp/edit_command.tmp
  commandline > $tmpFile
  evalh /usr/bin/vi $tmpFile
  commandline -r (cat $tmpFile)
  rm $tmpFile
end
