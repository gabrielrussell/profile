func! CreateToggle(name,oncode,offcode)
  exec
  \ "let g:" . a:name .  "toggle = 0 \n" .
  \ "func! " .  a:name .  "(...)\n" .
  \     "if g:" .  a:name .  "toggle == 0\n" .
  \         a:oncode . "\n" .
  \         "echo \"" . a:name .  " On\"\n" .
  \     "else\n" .
  \         a:offcode .  "\n" .
  \         "echo \"" .  a:name .  " Off\"\n" .
  \     "endif\n" .
  \     "let g:" .  a:name .  "toggle = ! g:" .  a:name .  "toggle\n" .
  \ "endfunc\n" 
endfunc

func! MapToggle(key,name,oncode,offcode)
    call CreateToggle(a:name,a:oncode,a:offcode)
    exec "map ". a:key . " :call " . a:name . "()<CR>"
endfunc
