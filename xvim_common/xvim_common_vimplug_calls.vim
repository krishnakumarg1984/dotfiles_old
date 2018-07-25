" Plug 'airblade/vim-gitgutter'
" Plug 'ajgrf/parchment'
" Plug 'ayu-theme/ayu-vim'
" Plug 'blueyed/vim-diminactive'
" Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'danilo-augusto/vim-afterglow'
" Plug 'dbmrq/vim-ditto'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'fenetikm/falcon'
" Plug 'fgrsnau/ncm-otherbuf'
" Plug 'itchyny/lightline.vim'
" Plug 'janko-m/vim-test'
" Plug 'junegunn/vim-slash'
" Plug 'mbbill/undotree'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'poppyschmo/vim-latexrefman',{'for':'tex'}
" Plug 'reedes/vim-litecorrect'
" Plug 'roxma/nvim-completion-manager'
" Plug 'ryanoasis/vim-devicons'
" Plug 'sedm0784/vim-you-autocorrect',{'for': ['tex','text','markdown']}
" Plug 'sheerun/vim-polyglot'
" Plug 'simnalamburt/vim-mundo'
" Plug 'SirVer/ultisnips'
" Plug 'tpope/vim-commentary',{'for':['tex','matlab','sh','dot','markdown','vim','muttrc']} "gcc, gc3j, gc}, gcip, gcu
" Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-surround'
" Plug 'unblevable/quick-scope' " for f, F, t and T
" Plug 'zhamlin/tiler.vim'
" Plug 'gregsexton/gitv', { 'on' : 'Gitv' }

Plug 'andymass/vim-matchup' " %, a%, i%, ]%, g%, [%
Plug 'antoyo/vim-licenses'
Plug 'cohama/lexima.vim'
Plug 'critiqjo/husk-x.vim' " for command line mode (readline bindings)
Plug 'daeyun/vim-matlab', { 'do': 'UpdateRemotePlugins' }
Plug 'dbmrq/vim-dialect'
Plug 'dhruvasagar/vim-table-mode'
Plug 'flazz/vim-colorschemes'
Plug 'frioux/vim-regedit'
Plug 'godlygeek/tabular',{'for':['matlab']}
Plug 'google/vim-searchindex'
Plug 'honza/vim-snippets'
Plug 'jacoborus/tender.vim'
Plug 'JamieJQuinn/vim-madoko',{'for':['madoko']}
Plug 'joom/latex-unicoder.vim',{'for':['latex','tex']}
Plug 'junegunn/fzf',{'dir': '~/.fzf', 'do': '.install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',{'for':['tex','text','matlab','txt','markdown']} " :Goyo to toggle
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'KabbAmine/zeavim.vim'
Plug 'kana/vim-textobj-user'
Plug 'Konfekt/FastFold'
Plug 'kshenoy/vim-signature' "place, toggle and display marks. Navigate forward/backward by position/alphabetical order. Any arbitrary sign for marks is possible
Plug 'leafgarland/typescript-vim',{'for': 'typescript'}
Plug 'lervag/file-line'
Plug 'lervag/vimtex',{'for':'tex'}
Plug 'lfilho/cosco.vim'
Plug 'machakann/vim-columnmove'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'mhinz/vim-grepper'
Plug 'nelstrom/vim-visual-star-search'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'raphamorim/lucario'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-wordy',{'for':['tex','text','markdown']}
Plug 'rhysd/vim-grammarous'
Plug 'romainl/vim-cool'
Plug 'romainl/vim-qf'
Plug 'roman/golden-ratio'
Plug 'ron89/thesaurus_query.vim'
Plug 'sgur/vim-editorconfig'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'sjl/gundo.vim'
Plug 'thaerkh/vim-indentguides',{'for':['tex','markdown','vim']}
Plug 'thaerkh/vim-workspace'
Plug 'tomasiser/vim-code-dark'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
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

if has('nvim')
    	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    	" Plug 'Shougo/context_filetype.vim'
    	Plug 'Shougo/neco-vim'
    	Plug 'Shougo/neco-syntax'
    	Plug 'fszymanski/deoplete-abook'
    	Plug 'fszymanski/deoplete-emoji'
    	Plug 'lionawurscht/deoplete-biblatex'
    	Plug 'Shougo/neoinclude.vim'
else
    	Plug 'roxma/nvim-yarp'
    	Plug 'roxma/vim-hug-neovim-rpc'
    	Plug 'nhooyr/neoman.vim'
endif
