vnoremap ;s :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    let prepositions =["a","an","amid","apud","as","at","atop","but","by","chez","down","for","from","in","into","less","near","of","off","on","onto","out","over","past","per","pre","pro","qua","than","to","up","upon","via","with"]
    let s:old=@@
    if a:type ==# "v"
        execute "normal! `<v`>y"
    elseif a:type ==# "char"
        execute "normal! `[v`]y"
    else
        return
    endif
    " normal gvd
    echom @@
    let s:words=split(@@)
    for s:word in s:words
        let s:letters=split(s:word,'\zs')
        let s:letters[0]=toupper(s:letters[0])
        let s:word=join(s:letters,'')
        echom s:word
        " echom s:letters[0]
    endfor
    echom len(s:words)
    let @@=s:old
endfunction
