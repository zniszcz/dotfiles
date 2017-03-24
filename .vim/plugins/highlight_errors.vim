function! highlight_errors#GetOverLengthMath(colored_line_number)
    return '\%>' . a:colored_line_number . 'v'
endfunction

function! highlight_errors#ColorToLongLines(colored_line_number)
    highlight OverLength ctermbg=magenta ctermfg=white guibg=#592929
    let a:match = highlight_errors#GetOverLengthMath(a:colored_line_number)
    call matchadd('OverLength', a:match, 80) "set column nr
endfunction

function! highlight_errors#ColorWhitespaces()
    highlight ExtraWhitespace ctermbg=red guibg=red
    call matchadd('ExtraWhitespace', '/\s\+$/', 60)
    call matchadd('ExtraWhitespace', '/\s\+$\| \+\ze\t/', 60)
    call matchadd('ExtraWhitespace', '/[^\t]\zs\t\+/', 60)
    call matchadd('ExtraWhitespace', '/^\t*\zs \+/', 60)
    call matchadd('ExtraWhitespace', '/\s\+$/', 60)
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
endfunction

function! highlight_errors#CallColorLines()
    call highlight_errors#ColorWhitespaces()
    call highlight_errors#ColorToLongLines(g:default_max_line)
endfunction

if exists("g:default_max_line")
  autocmd BufNewFile,BufRead * call highlight_errors#CallColorLines()
endif
autocmd BufNewFile,BufRead * call highlight_errors#ColorWhitespaces()
