GuiTabline 0
GuiPopupmenu 0
call GuiWindowMaximized(1)

if has('win32') || has('win64')
    if empty(glob('H:\cygwin_64_install\home\kg314\AppData\Local\nvim\autoload\plug.vim'))
	silent !curl -fLo H:\cygwin_64_install\home\kg314\AppData\Local\nvim\autoload\plug.vim --create-dirs
		    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	augroup vimplug
	    autocmd!
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	augroup END
    endif
else
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	augroup vimplug
	    autocmd!
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	augroup END
    endif
endif

if has('win32') || has('win64')
    call plug#begin('H:\cygwin_64_install\home\kg314\AppData\Local\nvim\plugged')
    source H:\cygwin_64_install\home\kg314\dotfiles\vim\vimrc_config\plugcalls.vim
    call plug#end()
else
    call plug#begin('~/.local/share/nvim/plugged')
    source ~/dotfiles/vim/vimrc_config/plugcalls.vim
    call plug#end()
endif

if has('win32') || has('win64')
    source H:\cygwin_64_install\home\kg314\dotfiles\vim\vimrc_config\vimrc
else
    source ~/dotfiles/vim/vimrc_config/vimrc
endif

" Don't load GUI menus; set here before GUI starts
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h12:cANSI
    endif
endif
