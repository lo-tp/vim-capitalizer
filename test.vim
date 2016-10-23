vnoremap ;s :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    let old=@@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif
    normal gvd
    echom @@
    let @@=old
endfunction
