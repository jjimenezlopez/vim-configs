set encoding=utf8
set fileencoding=utf8
set expandtab
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set guifont=Source\ Code\ Pro\ Medium\ 9 
" set guifont=Monofur\ 11 
set nowrap
" desactiva el fichero .swp
set nobackup
set nuw=5
colorscheme molokai
set number
set laststatus=2
set autoindent
set shiftround
set ruler
set showcmd
set cursorline
" Muestra el paréntesis que se corresponde con el situado bajo el cursor
set showmatch
" Ignora mayúsculas/minúsculas en las búsquedas
set ignorecase
" Si la búsqueda es en minúscula busca mayúsculas y minúsculas, si tiene
" alguna mayúscula no se aplica ignorecase
set smartcase
" El backspace funciona sobre todos los elementos en modo de insercción
set backspace=2
" Evita avisos sonoros
set visualbell
set noerrorbells
" Cuando se usa tab para completar una ruta o buffers muestra
" una lista
set wildmenu

" change the mapleader from \ to ,
let mapleader=","

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title

" Pathogen ----------------------------------------------------
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

syntax on
filetype on
filetype plugin on
filetype indent on


" vim-less
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>


" NERDTree ----------------------------------------------------
" open NERDTree automatically if no files were specified
" autocmd vimenter * if !argc() | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


map <F2> :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Closes a buffer: fs saves the file, fq close without saving
"
noremap fs <Esc>:call CleanClose(1)
noremap fq <Esc>:call CleanClose(0)

function! CleanClose(tosave)
  if (a:tosave == 1)
    w!
  endif
  let todelbufNr = bufnr("%")
  let newbufNr = bufnr("#")
  if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
  else
    bnext
  endif
  if (bufnr("%") == todelbufNr)
    new
  endif
  exe "bd".todelbufNr
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" neocomplcache autocompletes text
let g:neocomplcache_enable_at_startup = 1

" TagBar
nmap <F8> :TagbarToggle<CR>

" vim-snippets
let g:snippets_dir = '~/.vim/bundle/snipmate-snippets/snippets'

" snipmate for django
autocmd FileType python set filetype=python.django " For SnipMate
" autocmd FileType *.html set filetype=htmldjango.html " For SnipMate
autocmd BufRead,BufNewFile *.html set filetype=htmldjango.html
autocmd BufRead,BufNewFile *.less set filetype=less

" Activar fullscreen con F11
let g:fullscreen = 0
function! ToggleFullscreen()
  if g:fullscreen == 1
    let g:fullscreen = 0
    let mod = "remove"
    " Muestra el menú, barra de herramientas y scroll
    set guioptions=mT

  else
    let g:fullscreen = 1
    let mod = "add"
    " Oculta el menú, barra de herramientas y scroll
    set guioptions=aAce
  endif
  " Es necesario instalar la dependencia wmctrl
  call system("wmctrl -ir " . v:windowid . " -b " . mod . ",fullscreen")
endfunction
map <silent> <F11> :call ToggleFullscreen()<CR>                         

let g:syntastic_check_on_open = 1
let g:syntastic_warning_symbol = 'WW'
let g:syntastic_error_symbol = '!!'
let g:syntastic_python_checker="flake8"
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_javascript_checker=["jslint"]

let g:ctrlp_working_path_mode = ''

set exrc
set secure

" --------------------------
" Teclas rapidas
" --------------------------
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map <C-s> :w<CR>
map! <C-s> <ESC>:w<CR>

map <C-PageDown>    :bn<CR>
map! <C-PageDown>    <ESC>:bn<CR>

map <C-PageUp>    :bp<CR>
map! <C-PageUp>    <ESC>:bp<CR>

map <F9> oimport ipdb; ipdb.set_trace()<CR>
map! <F9> import ipdb; ipdb.set_trace()<CR>

"map <F10> :new<CR>:read !svn diff <C-R>=expand("%:p:h")<C-R>=expand("%:t") <CR>:set syntax=diff buftype=nofile<CR>gg
map <F10> :new<CR>:read !svn diff <CR>:set syntax=diff buftype=nofile<CR>gg

map <F7> o# -*- coding: utf-8 -*-<CR>
map! <F7> # -*- coding: utf-8 -*-<CR>


let g:surround_45 = "{{ \r }}"

map <C-k> ysiw-<CR>
map! <C-k> <ESC>ysiw-<CR>

vmap <C-k> S-<CR>


" Bubble single lines in insert mode
imap <C-Up> <Esc>:m-2<CR>==gi
imap <C-Down> <Esc>:m+<CR>==gi
" Bubble single lines in normal mode
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines in visual mode
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Clone single lines in insert mode
imap <A-Up> <Esc>YPi
imap <A-Down> <Esc>Ypi

" Clone single lines in normal mode
nmap <A-Up> YP
nmap <A-Down> Yp

" Clone multiple lines in visual mode
vmap <A-Up> YP
vmap <A-Down> Yp


" hihglits -moz -webkit in CSS files
autocmd ColorScheme * highlight VendorPrefix guifg=#00ffff
autocmd ColorScheme * match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

" Markdown
"
" Primero aplicamos nowrap y nolinebreak para todos los tipos de ficheros 
au BufRead,BufNewFile * set nowrap
au BufRead,BufNewFile * set nolinebreak

" y ahora si es  markdown, aplicamos el wrap y demás
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md set wrap
au BufRead,BufNewFile *.md set linebreak
au BufRead,BufNewFile *.md set textwidth=120

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" gitgutter desactivado en tiempo real
let g:gitgutter_realtime = 0
