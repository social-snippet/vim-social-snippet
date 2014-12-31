function! social_snippet#complete#is_repo_name_mode(str)
  return a:str =~ '@snip\(pet\)\?\s*<[^:\#>]*$'
endfunction

function! social_snippet#complete#is_file_name_mode(str)
  return a:str =~ '@snip\(pet\)\?\s*<[^:\#>]*:[^>]*$'
endfunction

function! social_snippet#complete#call(keyword)
  if ! g:social_snippet#complete#enable
    return []
  endif

  call social_snippet#init#ruby()

  if social_snippet#complete#is_repo_name_mode(a:keyword)
    return social_snippet#complete#complete(a:keyword)
  elseif social_snippet#complete#is_file_name_mode(a:keyword)
    return social_snippet#complete#complete(a:keyword)
  endif

  return []
endfunction

function! social_snippet#complete#complete(keyword)
  if social_snippet#util#ruby_is_enabled()
    return social_snippet#complete#complete_ruby(a:keyword)
  else
    return social_snippet#complete#complete_cli(a:keyword)
  endif
endfunction

function! social_snippet#complete#complete_ruby(keyword)
  ruby << END_OF_SCRIPT
key = VIM.evaluate('a:keyword')
ret = @social_snippet.api.complete_snippet_path(key).map {|cand| "\"#{cand}\"" }
VIM.command "let ret = [#{ret.join(",")}]"
END_OF_SCRIPT
  return ret
endfunction

function! social_snippet#complete#complete_cli(keyword)
  return split(system("sspm complete " . shellescape(a:keyword)), "\n")
endfunction
