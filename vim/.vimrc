if has('win32') || has('win64')
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

if has('win32') || has('win64')
    call plug#begin('~/vimfiles/plugged')
    source H:\cygwin_64_install\home\kg314\dotfiles\vim\vimrc_config\plugcalls.vim
    call plug#end()
else
    call plug#begin('~/.vim/plugged')
    source ~/dotfiles/vim/vimrc_config/plugcalls.vim
    call plug#end()
endif

" Require at least Vim 7.0 (released 2006-05-08); otherwise, self-suppress as much of this config as possible
if v:version < 700
  if has('win32') || has('win64')
    set runtimepath-=~/vimfiles
    set runtimepath-=~/vimfiles/after
  else
    set runtimepath-=~/.vim
    set runtimepath-=~/.vim/after
  endif
  finish
endif

source ~/dotfiles/vim/vimrc_config/vimrc
