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
  let l:line = search('^#') - 1
  call append(l:line, [l:dco])
endfunction
