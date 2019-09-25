function! Strip(input_string)
    return substitute(a:input_string, '^\n*\(.\{-}\)\n*$', '\1', '')
endfunction

function! dco#AddDCO()
  let l:name_cmd = 'git config user.name'
  let l:email_cmd = 'git config user.email'
  let l:dco_prefix = 'Signed-off-by: '
  let l:name = system(l:name_cmd)
  let l:email = system(l:email_cmd)
  let l:dco = l:dco_prefix . Strip(l:name) . ' <' . Strip(l:email) . '>'
  let l:lines = []
  " First, let's look for a commented-out line - since normally git will
  " insert one
  let l:line = search('^#')
  if (l:line != 0)
    let l:line = l:line - 1
  else
    " If we don't find the git comment, let's insert after the last line
    let l:line = line('$')
  endif
  if (getline(l:line) != '')
    let l:lines += ['']
  endif
  let l:lines += [l:dco]
  call append(l:line, l:lines)
endfunction
