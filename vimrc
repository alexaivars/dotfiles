" call pathogen#infect()
" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.


filetype off
filetype plugin indent on

set nocompatible                  " Must come first because it changes other options.
nnoremap <Space> <nop>

let mapleader = ","
" let mapleader = " "


" set mouse=a
set clipboard=unnamed


silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set showmatch

set wildignore='tmp/*,*/tmp/*,*/tmp/**/*'

" Some options from
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful
set encoding=utf-8
set fileencoding=utf-8
set autoindent
set cursorline
set modelines=0
set ttyfast
" set relativenumber if we are using a newer vim
if v:version >= 703 && has("autocmd")
  autocmd BufEnter * set relativenumber
endif 

set nowrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

" Folding settings
set foldmethod=indent
set foldlevel=1
set foldnestmax=3
set nofoldenable

" Move lines up and down
" noremap <C-J> :m +1 <CR>
" noremap <C-K> :m -2 <CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" No Help, please
noremap <F1> <Esc>

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile
" set directory=$HOME/.vim/tmp        " Keep swap files in one location
" set backupdir=$HOME/.vim/tmp

set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set listchars=tab:»»,trail:·
set list
set laststatus=2                 " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99F\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P



noremap <Leader>pt :Neoformat prettiereslint<CR>
noremap <Leader>ff :Neoformat prettiereslint<CR>
noremap <Space><Space> :buffer #<CR>

" let g:solarized_termcolors=16
" colorscheme solarized
" set background=dark

" set t_Co=16
" colorscheme railscasts

" set background=dark
" solarized options 
" let g:solarized_termcolors = 16
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_style = "dark"
" colorscheme solarized

syntax on
colorscheme solarized 
set background=light

" Moving
nnoremap / /\v
vnoremap / /\v

" "makes j and k work the way you expect instead of working in some archaic
" “movement by file line instead of screen line” fashion."
nnoremap j gj
nnoremap k gk

" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Searching
set gdefault

" In visual mode, indent and keep selection
vmap > >gv
vmap < <gv


" Move selection up/down (add =gv to reindent after move)
vmap <D-S-Up> :m-2<CR>gv
vmap <D-S-Down> :m'>+<CR>gv

" Tab mappings.
noremap <leader>tt :tabnew<cr>
" noremap <leader>te :tabedit
noremap <leader>tc :tabclose<cr>
" noremap <leader>to :tabonly<cr>
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprevious<cr>
" noremap <leader>tf :tabfirst<cr>
" noremap <leader>tl :tablast<cr>
" noremap <leader>tm :tabmove
noremap <D-S-Left> :tabprevious<cr>
noremap <D-S-Right> :tabnext<cr>
" map <Leader>b :TMiniBufExplorer<cr>

" F2 toggles folding
inoremap <F2> <C-O>za
nnoremap <F2> za
onoremap <F2> <C-C>za
vnoremap <F2> zf

" Nerdtree (,n)
map <F3> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

" Create a split on the given side.
" From http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/ via joakimk.
nmap <leader><left>   :leftabove  vnew<CR>
nmap <leader><right>  :rightbelow vnew<CR>
nmap <leader><up>     :leftabove  new<CR>
nmap <leader><down>   :rightbelow new<CR>

" Ack/Quickfix windows
nmap <Leader>q :cclose<CR>
nmap <leader>h :noh<cr>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Controversial...swap colon and semicolon for easier commands
" nnoremap ; :
" vnoremap ; :

" Source the vimrc file after saving it
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
  autocmd BufNewFile,BufReadPost *.py set filetype=python
  autocmd BufNewFile,BufReadPost *.py setl shiftwidth=2 expandtab
  autocmd BufNewFile,BufReadPost *.go set filetype=go
  autocmd BufNewFile,BufReadPost *.go setl shiftwidth=2 expandtab
  autocmd BufNewFile,BufReadPost *.erb set filetype=eruby
  " autocmd FileType go autocmd BufWritePre <buffer> Fmt
endif

" command! LargeFont :set guifont=Menlo:h18
" command! SmallFont :set guifont=Menlo:h11

if &t_Co > 2 || has("gui_runing")
  syntax on
endif

" noremap <Leader>d <Esc>:call CleanClose(1)<CR>
"
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
" Search for selected text, forwards or backwards.
" vnoremap <silent> * :<C-U>
"  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"  \gvy/<C-R><C-R>=substitute(
"  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"  \gV:call setreg('"', old_reg, old_regtype)<CR>
" vnoremap <silent> # :<C-U>
"  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"  \gvy?<C-R><C-R>=substitute(
"  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"  \gV:call setreg('"', old_reg, old_regtype)<CR>
"

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

" Disable netrw's autocmd, since we're ALWAYS using NERDTree
runtime plugin/netRwPlugin.vim
augroup FileExplorer
  au!
augroup END

let g:NERDTreeHijackNetrw = 0

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Alias commands
command! W :w
command! MRU CtrlPMRU
