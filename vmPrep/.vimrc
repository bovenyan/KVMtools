set nocompatible
set nu
filetype off
syntax on
set tabstop=4
set shiftwidth=4
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

" A wrapper function to restore the cursor position, window position,
" and last search after running a command.
function! Preserve(command)
    " Save the last search
    let last_search=@/
    " Save the current cursor position
    let save_cursor = getpos(".")
    " Save the window position
    normal H
    let save_window = getpos(".")
    call setpos('.', save_cursor)

    " Do the business:
    execute a:command
    " execute a:command
    " Restore the last_search
    let @/=last_search
    " Restore the window position
    call setpos('.', save_window)
    normal zt
    " Restore the cursor position
    call setpos('.', save_cursor)
endfunction

"shortcut
nmap <silent> <F5> :YcmForceCompileAndDiagnostics<CR><CR>
nmap <F3> :call Preserve("%!astyle --mode=c -A2")<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
map <F4> <leader>jd

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:ycm_path_to_python_interpreter="/usr/bin/python"
