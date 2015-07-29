function fa
   find /usr/share/applications/ -regex '.*.desktop' | fzf > /tmp/tmp; \
     and exo-open (cat /tmp/tmp) >/dev/null ^/dev/null
end

  
