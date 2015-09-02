function exit
  if test $VIM
    nvimex "Sayonara"
  else
    builtin exit
  end
end

