" todo: Capitalize the first and the last word
"
vnoremap ;s :<c-u>call GrepOperator(visualmode())<cr>


function! s:Capitalize(word)
    let l:letters=split(a:word,'\zs')
    let l:letters[0]=toupper(l:letters[0])
    return join(l:letters,'')
endfunction

function! GrepOperator(type)
    let l:prepositions =["a","an","amid","apud","as","at","atop","but","by","chez","down","for","from","in","into","less","near","of","off","on","onto","out","over","past","per","pre","pro","qua","than","to","up","upon","via","with",'the','some','a','an','for','and','nor','but','or','yet','so']
    let l:old = @x
    normal gv"xy

    let l:words=split(@x)
    let l:index=0
    for l:word in l:words
        if index(l:prepositions,l:word) == -1
            let l:word=s:Capitalize(l:word)
        endif
        let l:words[l:index]=l:word
        let l:index+=1
    endfor
    let l:lastIndex=len(l:words)-1
    let l:words[0]=s:Capitalize(l:words[0])
    let l:words[l:lastIndex]=s:Capitalize(l:words[l:lastIndex])
    let @x=join(l:words,' ')
    normal gvd
    normal "xp
    let @x=l:old
endfunction
