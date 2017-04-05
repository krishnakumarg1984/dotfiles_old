call plug#begin('~/.local/share/nvim/plugged')
     Plug 'flazz/vim-colorschemes'
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'
     " Plug 'Yggdroot/indentLine', {'for': 'python'}
     " Plug 'davidhalter/jedi-vim', {'for': 'python'}
     " Plug 'nvie/vim-flake8', {'for': 'python'}
     " Plug 'python-mode/python-mode'{'for':'python'}
     " Plug 'tpope/vim-abolish',{'for': ['text','tex']}
     " Plug 'fisadev/vim-isort', {'for': 'python'}
     Plug 'simnalamburt/vim-mundo'
     Plug 'haya14busa/incsearch.vim' " Better incsearch than vim's default. Further mappings present later in this file
     Plug 'haya14busa/incsearch-fuzzy.vim'
     Plug 'tpope/vim-surround'
     Plug 'tommcdo/vim-exchange'
     Plug 'kurkale6ka/vim-swap'
     Plug 'mhinz/vim-startify'
     " Plug 'godlygeek/tabular'
     Plug 'junegunn/vim-easy-align'
     " Plug 'tomtom/tcomment_vim'
     Plug 'tpope/vim-commentary'
     Plug 'kshenoy/vim-signature'
     Plug 'machakann/vim-highlightedyank'
     Plug 'jiangmiao/auto-pairs'
     Plug 'wellle/targets.vim'
     Plug 'lambdalisue/gina.vim'
     Plug 'lambdalisue/vim-diffa'
     Plug 'tpope/vim-fugitive'
     " Plug 'jreybert/vimagit'
     " Plug 'scrooloose/nerdtree'
     " Plug 'ctrlpvim/ctrlp.vim'
     " Plug 'wincent/command-t', {'do': 'cd ruby/command-t && ruby extconf.rb && make'}
     Plug 'majutsushi/tagbar', {'for': ['cpp', 'c', 'go', 'sh', 'javascript']}
     Plug 'airblade/vim-gitgutter'
     Plug 'ervandew/supertab'
     Plug 'tpope/vim-repeat'
     " Plug 'tpope/speeddating.vim'
     Plug 'tyru/capture.vim' "capture ex-command outputs
     " Plug 'Valloric/YouCompleteMe'
     " Plug 'ajh17/VimCompletesMe'
     " Plug 'honza/vim-snippets'
     " Plug 'Shougo/neosnippet.vim'
     " Plug 'Shougo/neosnippet-snippets.vim'
     " Plug 'SirVer/ultisnips'
     " Plug 'mileszs/ack.vim'
     Plug 'mhinz/vim-grepper'
     Plug 'tpope/vim-eunuch'
     Plug 'ntpeters/vim-better-whitespace' " :ToggleWhitespace, :StripWhitespace
     " Plug 'sheerun/vim-polyglot'
     Plug 'gregsexton/gitv'
     Plug 'junegunn/vim-peekaboo'
     Plug 'luochen1990/rainbow'
     " Plug 'junegunn/rainbow_parentheses.vim'
     Plug 'Ron89/thesaurus_query.vim',{'for': ['tex','text']} "\cs
     Plug 'reedes/vim-lexical',{'for': ['tex','text']}
     Plug 'reedes/vim-litecorrect',{'for': ['tex','text']}
     Plug 'reedes/vim-pencil',{'for': ['tex','text']}
     Plug 'dbmrq/vim-ditto',{'for': ['tex','text']}
     Plug 'junegunn/limelight.vim'
     Plug 'junegunn/goyo.vim' " :Goyo to toggle
     Plug 'kana/vim-textobj-user'
     " Plug 'reedes/vim-textobj-quote'
     Plug 'reedes/vim-textobj-sentence',{'for': ['tex','text']} " as, is, g), g(, ), (
     Plug 'reedes/vim-wheel' " a different scrolling experience
     Plug 'reedes/vim-wordy',{'for': ['tex','text']}
     Plug 'chrisbra/csv.vim'
     Plug 'chrisbra/improvedft'
     " Plug 'unblevable/quick-scope' " for f, F, t and T
     " Plug 'rhysd/clever-f.vim'
     Plug 'nhooyr/neoman.vim'
     Plug 'coderifous/textobj-word-column.vim'  " provides cic and vic mappings
     "osyo-manga/vim-watchdogs
     Plug 'vim-utils/vim-troll-stopper' " highlights invalid unicode characters
     Plug 'vim-utils/vim-husk' " for command line mode (readline bindings)
     Plug 'rhysd/vim-textobj-anyblock' " provides ib and ab objects
     Plug 'osyo-manga/vim-over'
     Plug 'lifepillar/vim-cheat40'
     Plug 'timakro/vim-searchant'
     Plug 'tpope/vim-obsession'
     Plug 'google/vim-searchindex'
     Plug 'google/vim-maktaba'
     Plug 'google/vim-glaive'
     Plug 'google/vim-codefmt'
     Plug 'google/vim-syncopate'
     Plug 'lambdalisue/vim-foldround'
     Plug 'lambdalisue/lista.nvim'
     Plug 'tmux-plugins/vim-tmux-focus-events'
     Plug 'tpope/vim-characterize'
     Plug 'ludovicchabant/vim-gutentags'
     Plug 'romainl/vim-qf'
     Plug 'romainl/vim-qlist'
     " Plug 'romainl/tinyMRU'
     Plug 'romainl/vim-cool'
     Plug 'justinmk/vim-sneak'
     Plug 'tomtom/ttags_vim'

call plug#end()

nnoremap <F2> :MundoToggle<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"----- incsearch.vim plugin ----------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
set hlsearch
nmap <silent><leader><space> ;nohls<CR>
"Clear highlighted search
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

let g:highlightedyank_highlight_duration = 500

nmap <Leader>ff <Plug>(foldround-forward)
nmap <Leader>fb <Plug>(foldround-backward)

nmap <F8> :TagbarToggle<CR>
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

