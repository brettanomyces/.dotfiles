function fa
   set tmpFile /tmp/fa.tmp
   begin
     find /usr/share/applications/ -regex '.*\.desktop'
     find /usr/local/share/applications/ -regex '.*\.desktop'
   end | fzf > $tmpFile 
   and evalh "exo-open" (cat $tmpFile) ">/dev/null ^/dev/null"
   rm $tmpFile
end

  
