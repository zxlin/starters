" Custom Syntax Highlighting Rules "
" Array Brackets [ ]
hi jsBrackets     ctermfg=170
" Function Braces { }
hi jsFuncBraces   ctermfg=81
" Function Arguments function(arg) {}
hi jsFuncArgs     ctermfg=172
" Function Call func()
hi jsFuncCall     ctermfg=10
" Function Keys  { func : function() {} }
hi jsFunctionKey  ctermfg=10

syntax keyword jsRequire    require
hi link jsRequire           Keyword
hi link jsAsyncKeyword      Noise
