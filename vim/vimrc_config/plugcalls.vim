" Plug 'broesler/jupyter-vim'
" Plug 'cespare/vim-toml'
" Plug 'chemzqm/vim-jsx-improve', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'dag/vim-fish'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'digitaltoad/vim-pug', { 'for': ['pug', 'vue'] }
" Plug 'gcavallanti/vim-noscrollbar'
" Plug 'goerz/jupytext.vim'
" Plug 'google/vim-searchindex'
" Plug 'hauleth/asyncdo.vim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'honza/vim-snippets'
" Plug 'hsanson/vim-android'
" Plug 'joereynolds/gq.vim'
" Plug 'jparise/vim-graphql', { 'for': ['javascript', 'javascript.jsx', 'graphql'] }
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Plug 'keith/swift.vim'
" Plug 'liuchengxu/vista.vim'
" Plug 'markonm/traces.vim'
" Plug 'mwouts/jupytext'
" Plug 'othree/html5.vim', { 'for': ['html', 'vue'] }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'vue'] }
" Plug 'rust-lang/rust.vim'
" Plug 'Sammyalhashe/random_colorscheme.vim'
" Plug 'SirVer/ultisnips'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'tfnico/vim-gradle'
" Plug 'thinca/vim-quickrun'
" Plug 'tpope/vim-dispatch'
" Plug 'udalov/kotlin-vim'
" Plug 'tomarrell/vim-npr'

Plug 'andymass/vim-matchup' " %, a%, i%, ]%, g%, [%
Plug 'critiqjo/husk-x.vim' " for command line mode (readline bindings)
Plug 'eiginn/netrw'
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }
Plug 'flazz/vim-colorschemes'
Plug 'haya14busa/vim-edgemotion'
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
Plug 'lervag/vimtex'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'moll/vim-bbye'
Plug 'ntpeters/vim-better-whitespace'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'paroxayte/vwm.vim'
Plug 'pdurbin/vim-tsv'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'rbong/vim-flog'
Plug 'romainl/vim-cool'
Plug 'romainl/vim-qf'
Plug 'RRethy/vim-illuminate'
Plug 'schickling/vim-bufonly', { 'on': 'BufOnly' }
Plug 'sgur/vim-editorconfig'
Plug 'simnalamburt/vim-mundo'
Plug 'sodapopcan/vim-twiggy'
Plug 'tell-k/vim-autopep8'
Plug 'thaerkh/vim-indentguides',{'for':['tex','markdown','vim','python']} "nathanaelkane's version is also available
Plug 'tmhedberg/SimpylFold'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'wellle/targets.vim'
Plug 'wincent/terminus' " sets up checktime & autoread even for neovim


if has('win32') || has('win64')
    " Plug 'ctrlpvim/ctrlp.vim'
    " Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}
     Plug 'Yggdroot/LeaderF' ", { 'do': '.\install.bat' }
else
    Plug 'junegunn/fzf',  { 'dir': '~/.fzf' }
    Plug 'junegunn/fzf.vim'
endif

if executable('tmux')

    " let vim detect tmux focus event correctly, see
    " http://tinyurl.com/y4xd2w3r and http://tinyurl.com/y4878wwm
    Plug 'tmux-plugins/vim-tmux-focus-events'

    " .tmux.conf syntax highlighting and setting check
    Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
endif

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'skywind3000/gutentags_plus'
endif

" Plugin: Completion and snippets
if has('nvim') || v:version >= 800
    Plug 'Shougo/deoplete.nvim',
                \ has('nvim') ? { 'do': ':UpdateRemotePlugins' } : {}
    Plug 'w0rp/ale'
    Plug 'tpope/vim-sensible'
    Plug 'deathlyfrantic/deoplete-spell'
    if has('win32') || has('win64')
        Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
    else
        Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
    end
elseif v:version>= 800 && has('python3')
    Plug 'roxma/nvim-yarp'
endif

Plug 'roxma/vim-hug-neovim-rpc', has('nvim') ? { 'on' : [] } : {}
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

