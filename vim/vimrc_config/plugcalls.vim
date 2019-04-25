" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
Plug 'andymass/vim-matchup' " %, a%, i%, ]%, g%, [%
Plug 'critiqjo/husk-x.vim' " for command line mode (readline bindings)
Plug 'flazz/vim-colorschemes'
Plug 'google/vim-searchindex'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'Konfekt/FastFold'
Plug 'kshenoy/vim-signature' "place, toggle and display marks. Navigate forward/backward by position/alphabetical order. Any arbitrary sign for marks is possible
Plug 'lervag/file-line'
Plug 'lervag/vimtex',{'for':'tex'}
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'markonm/traces.vim'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'romainl/vim-cool'
Plug 'romainl/vim-qf'
Plug 'RRethy/vim-illuminate'
Plug 'schickling/vim-bufonly'
Plug 'sgur/vim-editorconfig'
Plug 'thaerkh/vim-indentguides',{'for':['tex','markdown','vim']}
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'wellle/targets.vim'
Plug 'wincent/terminus'

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
endif

" Plugin: Completion and snippets
" if has('nvim') || v:version >= 800
"   Plug 'Shougo/deoplete.nvim',
"         \ has('nvim') ? { 'do': ':UpdateRemotePlugins' } : {}
" endif
Plug 'roxma/vim-hug-neovim-rpc', has('nvim') ? { 'on' : [] } : {}
Plug 'roxma/nvim-yarp'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

if has('nvim') || v:version >= 800
  Plug 'w0rp/ale'
endif
