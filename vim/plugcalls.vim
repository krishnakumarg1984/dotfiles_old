" Plug 'broesler/jupyter-vim'
" Plug 'cespare/vim-toml'
" Plug 'chemzqm/vim-jsx-improve', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'dag/vim-fish'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'digitaltoad/vim-pug', { 'for': ['pug', 'vue'] }
" Plug 'fcpg/vim-osc52'
" Plug 'flazz/vim-colorschemes'
" Plug 'gcavallanti/vim-noscrollbar'
" Plug 'goerz/jupytext.vim'
" Plug 'google/vim-searchindex'
" Plug 'hauleth/asyncdo.vim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'honza/vim-snippets'
" Plug 'hsanson/vim-android'
" Plug 'jiangmiao/auto-pairs' " a bit code-heavy vimscript plugin (scc cloc)
" Plug 'joereynolds/gq.vim'
" Plug 'jparise/vim-graphql', { 'for': ['javascript', 'javascript.jsx', 'graphql'] }
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
" Plug 'keith/swift.vim'
" Plug 'liuchengxu/vista.vim'
" Plug 'majutsushi/tagbar'
" Plug 'markonm/traces.vim'
" Plug 'metakirby5/codi.vim' " interactive interpreter
" Plug 'mhinz/vim-startify'
" Plug 'mwouts/jupytext'
" Plug 'othree/html5.vim', { 'for': ['html', 'vue'] }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'vue'] }
" Plug 'rust-lang/rust.vim'
" Plug 'Sammyalhashe/random_colorscheme.vim'
" Plug 'SirVer/ultisnips'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'sunaku/vim-shortcut'
" Plug 'tfnico/vim-gradle'
" Plug 'thinca/vim-quickrun'
" Plug 'tomarrell/vim-npr'
" Plug 'tommcdo/vim-exchange' " a bit code-heavy vimscript plugin (scc cloc)
" Plug 'tpope/vim-dispatch'
" Plug 'udalov/kotlin-vim'

" Plug 'christoomey/vim-conflicted'
" Plug 'hotwatermorning/auto-git-diff'
" Plug 'https://github.com/cohama/agit.vim'
" Plug 'idanarye/vim-merginal'
" Plug 'lambdalisue/gina.vim'
" Plug 'rhysd/committia.vim'
" Plug 'sodapopcan/vim-twiggy' " depends on vim-fugitive, a bit code-heavy vimscript plugin (scc cloc)
" Plug 'jreybert/vimagit'

Plug 'andymass/vim-matchup' " %, a%, i%, ]%, g%, [%
Plug 'critiqjo/husk-x.vim' " for command line mode (readline bindings)
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }
Plug 'haya14busa/vim-edgemotion'
Plug 'jeetsukumaran/vim-pythonsense',{'for':'python'}
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user' " a bit code-heavy vimscript plugin (scc cloc)
Plug 'Konfekt/FastFold'
Plug 'kshenoy/vim-signature' " place, toggle and display marks. Navigate forward/backward by position/alphabetical order. Any arbitrary sign for marks is possible
Plug 'lervag/file-line'
Plug 'lervag/vimtex'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich' " a bit code-heavy vimscript plugin (scc cloc)
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'moll/vim-bbye'
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'octol/vim-cpp-enhanced-highlight',{'for':['c','cpp']}  " a bit code-heavy vimscript plugin (scc cloc)
Plug 'paroxayte/vwm.vim'
Plug 'pdurbin/vim-tsv'
Plug 'plasticboy/vim-markdown', {'for':'markdown'}
Plug 'romainl/vim-cool'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'
Plug 'RRethy/vim-illuminate'
Plug 'schickling/vim-bufonly', {'on':'BufOnly'}
Plug 'sgur/vim-editorconfig'
Plug 'simnalamburt/vim-mundo'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'TaDaa/vimade'
Plug 'tell-k/vim-autopep8'
Plug 'thaerkh/vim-indentguides',{'for':['tex','markdown','vim','python']} "nathanaelkane's version is also available
Plug 'tmhedberg/SimpylFold'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-python/python-syntax',{'for':'python'}
Plug 'Vimjas/vim-python-pep8-indent',{'for':'python'}
Plug 'wellle/targets.vim'
Plug 'wincent/terminus' " sets up checktime & autoread even for neovim

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rbong/vim-flog', { 'on': ['Flog','Flogsplit', 'Floggit!'] } " a bit code-heavy vimscript plugin (scc cloc)

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
    Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'
    Plug 'deathlyfrantic/deoplete-spell'
    if has('win32') || has('win64')
        Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
    else
        Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
    end
elseif v:version>= 800 && has('python3')
    Plug 'roxma/nvim-yarp'
endif

if has('nvim')
    Plug 'tpope/vim-sensible'
end

Plug 'roxma/vim-hug-neovim-rpc', has('nvim') ? { 'on' : [] } : {}
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

