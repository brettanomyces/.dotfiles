function fa
   set tmpFile /tmp/fa.tmp
   begin
     find /usr/share/applications/ -regex '.*.desktop'
     find /usr/local/share/applications/ -regex '.*.desktop'
   end | fzf > $tmpFile 
   and exo-open (cat $tmpFile) ^/dev/null
   rm $tmpFile
end

  
