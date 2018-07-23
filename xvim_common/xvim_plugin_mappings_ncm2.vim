
" :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

augroup my_cm_setup
  	autocmd!
  	autocmd BufEnter * call ncm2#enable_for_buffer()
  	autocmd Filetype tex call ncm2#register_source({
  	                        \ 'name' : 'vimtex-cmds',
  	                        \ 'priority': 8, 
  	                        \ 'complete_length': -1,
  	                        \ 'scope': ['tex'],
  	                        \ 'matcher': {'name': 'prefix', 'key': 'word'},
  	                        \ 'word_pattern': '\w+',
  	                        \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
  	                        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  	                        \ })
  	autocmd Filetype tex call ncm2#register_source({
  	                        \ 'name' : 'vimtex-labels',
  	                        \ 'priority': 8, 
  	                        \ 'complete_length': -1,
  	                        \ 'scope': ['tex'],
  	                        \ 'matcher': {'name': 'combine',
  	                        \             'matchers': [
  	                        \               {'name': 'substr', 'key': 'word'},
  	                        \               {'name': 'substr', 'key': 'menu'},
  	                        \             ]},
  	                        \ 'word_pattern': '\w+',
  	                        \ 'complete_pattern': g:vimtex#re#ncm2#labels,
  	                        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  	                        \ })
  	autocmd Filetype tex call ncm2#register_source({
  	                        \ 'name' : 'vimtex-files',
  	                        \ 'priority': 8, 
  	                        \ 'complete_length': -1,
  	                        \ 'scope': ['tex'],
  	                        \ 'matcher': {'name': 'combine',
  	                        \             'matchers': [
  	                        \               {'name': 'abbrfuzzy', 'key': 'word'},
  	                        \               {'name': 'abbrfuzzy', 'key': 'abbr'},
  	                        \             ]},
  	                        \ 'word_pattern': '\w+',
  	                        \ 'complete_pattern': g:vimtex#re#ncm2#files,
  	                        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  	                        \ })
  	autocmd Filetype tex call ncm2#register_source({
  	                        \ 'name' : 'bibtex',
  	                        \ 'priority': 8, 
  	                        \ 'complete_length': -1,
  	                        \ 'scope': ['tex'],
  	                        \ 'matcher': {'name': 'combine',
  	                        \             'matchers': [
  	                        \               {'name': 'prefix', 'key': 'word'},
  	                        \               {'name': 'abbrfuzzy', 'key': 'abbr'},
  	                        \               {'name': 'abbrfuzzy', 'key': 'menu'},
  	                        \             ]},
  	                        \ 'word_pattern': '\w+',
  	                        \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
  	                        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  	                        \ })
augroup END

let g:ncm2_look_enabled = 1

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

