vnoremap ;s :<c-u>call GrepOperator(visualmode())<cr>


function! s:Capitalize(word)
        let l:letters=split(a:word,'\zs')
        let l:letters[0]=toupper(l:letters[0])
        return join(l:letters,'')
        
endfunction

function! GrepOperator(type)
    let l:prepositions =["a","an","amid","apud","as","at","atop","but","by","chez","down","for","from","in","into","less","near","of","off","on","onto","out","over","past","per","pre","pro","qua","than","to","up","upon","via","with",'the','some','a','an','for','and','nor','but','or','yet','so']
    let l:old=@@
    if a:type ==# "v"
        execute "normal! `<v`>y"
    elseif a:type ==# "char"
        execute "normal! `[v`]y"
    else
        return
    endif
    " normal gvd
    " echom @@
    let l:words=split(@@)
    for l:word in l:words
        if index(l:prepositions,l:word) == -1
            let l:word=s:Capitalize(l:word)
        endif
        echo l:word
    endfor
    " echom len(l:words)
    let @@=l:old
endfunction
