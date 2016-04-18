function fa
   set tmpFile /tmp/fa.tmp
   begin
     find /usr/share/applications/ -regex '.*\.desktop' ^/dev/null
     find /usr/local/share/applications/ -regex '.*\.desktop' ^/dev/null
   end | fzf > $tmpFile 
   and eval "exo-open" (cat $tmpFile) ">/dev/null ^/dev/null"
   rm $tmpFile
end

  
