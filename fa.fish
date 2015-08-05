function fa
   set tmpFile /tmp/fa.tmp
   find /usr/share/applications/ -regex '.*.desktop' | fzf > $tmpFile; \
     and exo-open (cat $tmpFile) >/dev/null ^/dev/null
   rm $tmpFile
end

  
