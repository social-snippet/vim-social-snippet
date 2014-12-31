let s:source = {
      \ "name" : "social_snippet",
      \ "mark" : "[SS]",
      \ "min_pattern_length": 1,
      \ "converters": [],
      \}

function! s:source.gather_candidates(context)
  let ret = social_snippet#complete#call(a:context.input)
  return map(ret, '{ "word" : v:val }')
endfunction

function! neocomplete#sources#social_snippet#define()
  return s:source
endfunction

