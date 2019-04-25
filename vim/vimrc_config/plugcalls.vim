" Plug 'broesler/jupyter-vim'
" Plug 'chemzqm/vim-jsx-improve', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'digitaltoad/vim-pug', { 'for': ['pug', 'vue'] }
" Plug 'gcavallanti/vim-noscrollbar'
" Plug 'goerz/jupytext.vim'
" Plug 'google/vim-searchindex'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'honza/vim-snippets'
" Plug 'hsanson/vim-android'
" Plug 'jparise/vim-graphql', { 'for': ['javascript', 'javascript.jsx', 'graphql'] }
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Plug 'keith/swift.vim'
" Plug 'mwouts/jupytext'
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'vue'] }
" Plug 'rust-lang/rust.vim'
" Plug 'Sammyalhashe/random_colorscheme.vim'
" Plug 'SirVer/ultisnips'
" Plug 'tfnico/vim-gradle'
" Plug 'thinca/vim-quickrun'
" Plug 'udalov/kotlin-vim'

Plug 'andymass/vim-matchup' " %, a%, i%, ]%, g%, [%
Plug 'cespare/vim-toml'
Plug 'critiqjo/husk-x.vim' " for command line mode (readline bindings)
Plug 'dag/vim-fish'
Plug 'dart-lang/dart-vim-plugin'
Plug 'eiginn/netrw'
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }
Plug 'flazz/vim-colorschemes'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
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
Plug 'moll/vim-bbye'
Plug 'ntpeters/vim-better-whitespace'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim', { 'for': ['html', 'vue'] }
Plug 'pdurbin/vim-tsv'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'rbong/vim-flog'
Plug 'romainl/vim-cool'
Plug 'romainl/vim-qf'
Plug 'RRethy/vim-illuminate'
Plug 'schickling/vim-bufonly', { 'on': 'BufOnly' }
Plug 'sgur/vim-editorconfig'
Plug 'tell-k/vim-autopep8'
Plug 'thaerkh/vim-indentguides',{'for':['tex','markdown','vim']} "nathanaelkane's version is also available
Plug 'tmhedberg/SimpylFold'
Plug 'tomarrell/vim-npr'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'wellle/targets.vim'
Plug 'wincent/terminus'


if executable('tmux')

    " let vim detect tmux focus event correctly, see
    " http://tinyurl.com/y4xd2w3r and http://tinyurl.com/y4878wwm
    Plug 'tmux-plugins/vim-tmux-focus-events'

    " .tmux.conf syntax highlighting and setting check
    Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
endif

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
endif

" Plugin: Completion and snippets
if has('nvim') || v:version >= 800
  Plug 'Shougo/deoplete.nvim',
        \ has('nvim') ? { 'do': ':UpdateRemotePlugins' } : {}
endif
Plug 'roxma/vim-hug-neovim-rpc', has('nvim') ? { 'on' : [] } : {}
Plug 'roxma/nvim-yarp'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'deathlyfrantic/deoplete-spell'

if has('nvim') || v:version >= 800
  Plug 'w0rp/ale'
endif
