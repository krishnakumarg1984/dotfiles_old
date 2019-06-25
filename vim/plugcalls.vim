" vim: ft=vim:

" Aesthetics
Plug 'gruvbox-community/gruvbox'

" Git
Plug 'tpope/vim-fugitive' | Plug 'rbong/vim-crystalline'

" General Purpose
Plug 'tpope/vim-repeat'

if has('nvim') || has('patch-7.4-399')
    Plug 'andymass/vim-matchup' " %, g%, [%,]%, a%, i%, 1i%, ]%, g%, [%
endif

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
    " Plug 'skywind3000/gutentags_plus'
endif

Plug 'jeffkreeftmeijer/vim-numbertoggle' " Toggles between hybrid and absolute line numbers automatically
Plug 'mhinz/vim-signify' " uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system (VCS).   ]c   Jump to next hunk. [c   Jump to previous hunk. ]C   Jump to last hunk. [C Jump to first hunk. 
Plug 'moll/vim-bbye' " delete buffers and close files without closing your windows or messing up your layout.
" Plug 'RRethy/vim-illuminate'
Plug 'schickling/vim-bufonly', {'on':'BufOnly'} " Delete all buffers except the current buffer. :BufOnly without an argument will delete all buffers but the current one.
Plug 'sgur/vim-editorconfig'
Plug 'TaDaa/vimade' " fades inactive buffers and preserves syntax highlighting
Plug 'thirtythreeforty/lessspace.vim' " strip trailing whitespace only on the lines edited or visited in Insert mode; it leaves all the others untouched.

Plug 'tpope/vim-abolish' " easily search for, substitute, and abbreviate multiple variants of a word 
" crs (coerce to snake_case), MixedCase (crm), camelCase (crc), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case (cr<space>), and Title Case (crt) 

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-unimpaired' " a/A = args/first(last), b/B = buffers/first(last), l/L= location/first(last), q/Q = quickfix/first(last), t/T = tab/first(last), f= file, n = conflict marker, <space> = blank lines, e = exchange lines, oc = cursor line, od = diffthis/diffoff, oh = hlsearch, oi = ignorecase, ol = list, on = number, or = relativenumber, os = spell, ou = cursorcolumn, ov = virtualedit, ow = wrap, ox = crosshairs, >p/>P = linewise paste increasing indent, <p/<P = linewise paste decreasing indent, =p linewise paste (reindenting)

Plug 'tpope/vim-eunuch' " Helpers for UNIX
" :Delete[!]              |:bdelete|, and, if successful, delete the file from disk.  If a bang is given, it is passed along to :bdelete.
" :Unlink[!]              Delete the file from disk and reload the buffer. If a bang is given, discard unsaved changes.
" :Remove[!]              Alias for :Unlink.
" :Move[!] {file} Like |:saveas|, but delete the old file afterwards.
" :Rename[!] {file}       Like |:Move|, but relative to the current file's containing directory.
" :Chmod {mode} Change the permissions of the current file.
" :Mkdir! {dir}           Create directory {dir} with |mkdir()| passing the "p" argument. This is like `mkdir -p`.
" :Mkdir[!]               With no argument, create the containing directory for the current file.
" :Cfind[!] {args}        Run `find` and load the results into the quickfix list. Jump to the first result unless ! is given.
" :Lfind[!] {args}        Run `find` and load the results into the location list.  Jump to the first result unless ! is given.
" :Clocate[!] {args}      Run `locate` and load the results into the quickfix list.  Jump to the first result unless ! is given.
" :Llocate[!] {args}      Run `locate` and load the results into the location list.  Jump to the first result unless ! is given.
" :SudoEdit [file]        Edit a file using sudo.  This overrides any read permission issues, plus allows you to write the file with :w!.
" :SudoWrite              Use sudo to write the file to disk.  Handy when you forgot to use sudo to invoke Vim.  This uses :SudoEdit internally, so after the first invocation you can subsequently use :w!.
" :W                      It also writes files that haven't changed, which is useful for kicking off build and test suites (such as with watchr or guard).  Furthermore, it handily doubles as a safe fallback for people who, like me, accidentally type :W instead of :w a lot.

Plug 'wellle/targets.vim' " accepts a count. Adds/improves text-objects i,I & a,A for ',\",`,),},B,],>,t,(,{,[,<.  Next pair & last pair
" New thing is the concept of separators. , . ; : + - = ~ _ * # / | \ & $.
" Another new thing is the concept of arguments - ia & aa,ina ana Ina Ana ila ala Ila Ala 
" Any block inb anb Inb Anb ilb alb Ilb Alb
" Any quote inq anq Inq Anq ilq alq Ilq Alq 

Plug 'wincent/terminus' " Allows Vim to receive FocusGained and FocusLost events, sets up checktime & autoread even for neovim, automatic bracketed paste, improved mouse support & cursor shape change

" Language-specific
Plug 'lervag/vimtex'

" coc.nvim
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
 " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'} " Json language extension for coc.nvim

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco', {'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/neoinclude.vim' | Plug 'jsfaint/coc-neoinclude', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'weirongxu/coc-calc', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-diagnostic', {'do': 'yarn install --frozen-lockfile'}

" coc-extension Language Servers
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}

" Custom Language Servers
Plug 'iamcco/coc-vimlsp'

