" Plug 'blueyed/vim-diminactive'
" Plug 'godlygeek/tabular',{'for':['tex','matlab','markdown','muttrc']}
" Plug 'janko-m/vim-test'
" Plug 'sjl/gundo.vim'
" Plug 'tpope/vim-obsession'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'JamieJQuinn/vim-madoko',{'for':['madoko']}
Plug 'Konfekt/FastFold'
Plug 'airblade/vim-gitgutter'
Plug 'andymass/vim-matchup'
Plug 'ayu-theme/ayu-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-navigator'
Plug 'critiqjo/husk-x.vim' " for command line mode (readline bindings)
Plug 'daeyun/vim-matlab', { 'do': 'UpdateRemotePlugins' }
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf',{'dir': '~/.fzf', 'do': '.install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',{'for':['tex','text','txt','markdown']} " :Goyo to toggle
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature' "place, toggle and display marks. Navigate forward/backward by position/alphabetical order. Any arbitrary sign for marks is possible
Plug 'leafgarland/typescript-vim',{'for': 'typescript'}
Plug 'lervag/vimtex',{'for':'tex'}
Plug 'lfilho/cosco.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-grepper'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'roman/golden-ratio'
Plug 'sgur/vim-editorconfig'
Plug 'sheerun/vim-polyglot'
Plug 'simnalamburt/vim-mundo'
Plug 'thaerkh/vim-indentguides'
Plug 'thaerkh/vim-workspace'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary',{'for':['tex','matlab','dot','markdown','vim','muttrc']} "gcc, gc3j, gc}, gcip, gcu
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope' " for f, F, t and T
Plug 'w0rp/ale'
Plug 'wannesm/wmgraphviz.vim',{'for':['dot','gv']}
Plug 'wellle/targets.vim' "To change the text in the next pair of parentheses, use the cin) command,To delete the item in a comma separated list under the cursor, use da, last pair seems very useful, i(,i),ib,i{,i},i[,i],i<,i>,it, with count, same with 'a'. n and l options, quotes, even back-ticks

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags' "Gutentags is a plugin that takes care of the much needed management of tags files in Vim. It will (re)generate tag files as you work while staying completely out of your way. It will even do its best to keep those tag files out of your way too. It has no dependencies and just works.
endif

