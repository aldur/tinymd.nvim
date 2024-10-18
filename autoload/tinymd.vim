" Return the header level at given line (>= 1) or -1
function! s:get_header_level(lnum) abort
    let header_start_pattern = '^#\+'
    return matchend(getline(a:lnum), header_start_pattern)
endfunction

" Return the current line's header level (>= 1) or -1
function! s:get_current_header_level() abort
    return s:get_header_level('.')
endfunction

function! tinymd#increase_header_level() abort
    let l:current_level = s:get_current_header_level()
    call setline('.', '#' . (l:current_level == -1 ? ' ' : '') . getline('.'))
endfunction

function! tinymd#decrease_header_level() abort
    let l:current_level = s:get_current_header_level()
    if l:current_level == -1 | return | endif

    let l:new_line = getline('.')[(l:current_level >= 2 ? 1 : 2):]
    call setline('.', l:new_line)
endfunction
