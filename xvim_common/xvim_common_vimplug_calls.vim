" Plug 'SirVer/ultisnips'
"Plug 'sheerun/vim-polyglot'
" Plug 'blueyed/vim-diminactive'
" Plug 'dbmrq/vim-ditto'
" Plug 'godlygeek/tabular',{'for':['tex','matlab','markdown','muttrc']}
" Plug 'janko-m/vim-test'
" Plug 'junegunn/vim-slash'
" Plug 'mbbill/undotree'
" Plug 'poppyschmo/vim-latexrefman',{'for':'tex'}
" Plug 'simnalamburt/vim-mundo'
" Plug 'tpope/vim-commentary',{'for':['tex','matlab','sh','dot','markdown','vim','muttrc']} "gcc, gc3j, gc}, gcip, gcu
" Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-surround'
" Plug 'unblevable/quick-scope' " for f, F, t and T

Plug 'lervag/vimtex',{'for':'tex'}
Plug 'tpope/vim-commentary'

Plug 'JamieJQuinn/vim-madoko',{'for':['madoko']}
Plug 'KabbAmine/zeavim.vim'
Plug 'Konfekt/FastFold'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'ajgrf/parchment'
Plug 'andymass/vim-matchup'
Plug 'ayu-theme/ayu-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'
Plug 'critiqjo/husk-x.vim' " for command line mode (readline bindings)
Plug 'daeyun/vim-matlab', { 'do': 'UpdateRemotePlugins' }
Plug 'danilo-augusto/vim-afterglow'
Plug 'dbmrq/vim-dialect'
Plug 'dhruvasagar/vim-table-mode'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'flazz/vim-colorschemes'
Plug 'frioux/vim-regedit'
Plug 'google/vim-searchindex'
Plug 'gregsexton/gitv', { 'on' : 'Gitv' }
Plug 'honza/vim-snippets'
Plug 'jacoborus/tender.vim'
Plug 'junegunn/fzf',{'dir': '~/.fzf', 'do': '.install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',{'for':['tex','text','txt','markdown']} " :Goyo to toggle
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature' "place, toggle and display marks. Navigate forward/backward by position/alphabetical order. Any arbitrary sign for marks is possible
Plug 'leafgarland/typescript-vim',{'for': 'typescript'}
Plug 'lervag/file-line'
Plug 'lfilho/cosco.vim'
Plug 'machakann/vim-columnmove'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'

Plug 'mhinz/vim-grepper'
Plug 'nelstrom/vim-visual-star-search'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'raphamorim/lucario'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-wordy',{'for':['tex','text','markdown']}

Plug 'rhysd/vim-grammarous'
Plug 'romainl/vim-cool'
Plug 'romainl/vim-qf'
Plug 'roman/golden-ratio'
Plug 'ron89/thesaurus_query.vim'

Plug 'sgur/vim-editorconfig'
Plug 'sjl/gundo.vim'
Plug 'thaerkh/vim-indentguides',{'for':['tex','markdown','vim']}
Plug 'thaerkh/vim-workspace'

Plug 'tomasiser/vim-code-dark'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tyru/capture.vim', { 'on' : 'Capture' }
Plug 'ujihisa/neco-look'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wannesm/wmgraphviz.vim',{'for':['dot','gv']}
Plug 'wellle/targets.vim' "To change the text in the next pair of parentheses, use the cin) command,To delete the item in a comma separated list under the cursor, use da, last pair seems very useful, i(,i),ib,i{,i},i[,i],i<,i>,it, with count, same with 'a'. n and l options, quotes, even back-ticks

if executable('ctags')
    	Plug 'ludovicchabant/vim-gutentags' "Gutentags is a plugin that takes care of the much needed management of tags files in Vim. It will (re)generate tag files as you work while staying completely out of your way. It will even do its best to keep those tag files out of your way too. It has no dependencies and just works.
endif

" Plug 'ryanoasis/vim-devicons'


if has('nvim')
    	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    	" Plug 'Shougo/context_filetype.vim'
    	Plug 'Shougo/neco-vim'
    	Plug 'Shougo/neco-syntax'
    	Plug 'fszymanski/deoplete-abook'
    	Plug 'fszymanski/deoplete-emoji'
    	Plug 'lionawurscht/deoplete-biblatex'
    	Plug 'Shougo/neoinclude.vim'
    	" Plug 'roxma/nvim-completion-manager'
    	" Plug 'fgrsnau/ncm-otherbuf'
else
    	Plug 'Shougo/deoplete.nvim'
    	Plug 'roxma/nvim-yarp'
    	Plug 'roxma/vim-hug-neovim-rpc'
    	Plug 'nhooyr/neoman.vim'
endif
