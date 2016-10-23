vnoremap ;s :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
let prepositions =["a","an","amid","apud","as","at","atop","but","by","chez","down","for","from","in","into","less","near","of","off","on","onto","out","over","past","per","pre","pro","qua","than","to","up","upon","via","with"]
    let old=@@
    if a:type ==# "v"
        execute "normal! `<v`>y"
    elseif a:type ==# "char"
        execute "normal! `[v`]y"
    else
        return
    endif
    normal gvd
    echom @@
    let @@=old
endfunction
