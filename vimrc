" call pathogen#infect()
" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.


filetype off
filetype plugin indent on

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

" runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                      " Show line numbers.
set ruler                         " Show cursor position.

" set nonumber foldcolumn=1
" hi foldcolumn guibg=#151515 guifg=#151515

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set showmatch

" set wildignore+='tmp/*'
set wildignore='tmp/*,*/tmp/*,*/tmp/**/*'

command! W :w

nnoremap <leader><space> :noh<cr>
nnoremap <leader>c :noh<cr>
nnoremap <leader>gc Gwrite \| Gcommit -m '

" bind control-l to hashrocket
imap <C-l> <Space>=><Space>"


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
" set expandtab

set laststatus=2                 " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99F\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P


" colorscheme railscasts_hms
" color jellybeans+


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
"colorscheme railscasts_16
" let g:solarized_termtrans = 1
colorscheme solarized 
set background=dark

let mapleader = ","

" Moving
nnoremap / /\v
vnoremap / /\v

" "makes j and k work the way you expect instead of working in some archaic
" “movement by file line instead of screen line” fashion."

" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" makes omnifunc work with ctrl space
" inoremap <C-Space> <C-x><C-o>
" inoremap <C-@> <C-Space>

nnoremap j gj
nnoremap k gk
nnoremap <leader><cr> o<esc>

" map <leader>c :ConqueTermSplit bash<cr>

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Searching
set gdefault

map <F4> :ls<CR>:b<space>

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

" autocmd BufEnter * NERDTreeMirror
" autocmd BufNew * wincmd l

" Split screen things
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Create a split on the given side.
" From http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/ via joakimk.
nmap <leader><left>   :leftabove  vnew<CR>
nmap <leader><right>  :rightbelow vnew<CR>
nmap <leader><up>     :leftabove  new<CR>
nmap <leader><down>   :rightbelow new<CR>


" nmap <leader>eh :'<,'>s/\v\</\&lt;/ | execute "normal gv" | '<,'>s/\v\>/&gt;/<CR>

" Edit shortcuts
" http://vimcasts.org/episodes/the-edit-command/
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>


" Buffer navigation
noremap <Leader>a :bprev<Return>
noremap <Leader>s :bnext<Return>
noremap <D-[> :bprev<return>
noremap <D-]> :bnext<return>

" Command T configuration
noremap <leader>t :CommandT<Return>
let g:CommandTMaxHeight=20

" vmap <leader>eh :s/\v\</\&lt;/ <CR> :execute "normal" "gv"<CR> :s/\v\>/\&gt;/<CR> :noh<CR>

" ZoomWin configuration
map <Leader>z :ZoomWin<CR>

" Ack/Quickfix windows
nmap <Leader>q :cclose<CR>
nmap <leader>h :noh<cr>

" CTags
" map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

noremap <Leader>rk :Rake<CR>

" Controversial...swap colon and semicolon for easier commands
nnoremap ; :
vnoremap ; :

" Rails Edit routes
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb
noremap <leader>rm :Rmodel
noremap <leader>rc :Rcontroller
noremap <leader>rv :Rview
nnoremap <leader>r :w \| !rspec --no-color %<cr>

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
" autocmd FileType scss setlocal foldmethod=indent shiftwidth=2 tabstop=2

" Source the vimrc file after saving it
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC
	autocmd BufNewFile,BufRead *.coffee set filetype=coffee
	autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
	autocmd BufNewFile,BufReadPost *.py set filetype=python
	autocmd BufNewFile,BufReadPost *.py setl shiftwidth=2 expandtab
	autocmd BufNewFile,BufReadPost *.go set filetype=go
	autocmd BufNewFile,BufReadPost *.go setl shiftwidth=2 expandtab
	" autocmd FileType go autocmd BufWritePre <buffer> Fmt
endif

" http://vimcasts.org/episodes/running-vim-within-irb/
" Restore cursor position
" autocmd BufReadPost *
"   \ if line("'\"") > 1 && line("'\"") <= line("$") |
"   \   exe "normal! g`\"" |
"   \ endif

" au FocusLost * :wa
" au FocusLost silent! :wa
" autocmd BufLeave,FocusLost * silent! wall
" autocmd BufLeave,FocusLost silent! wall

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" augroup md
"   autocmd BufRead *.md set ai formatoptions=tcroqn comments=n:&gt;
" augroup END

" Misc
map <Leader>u <Plug>MakeGreen
noremap <leader>cc Ypkgccj

" command to strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" I use Ack a lot (described below), so I mapped a leader key for it:
nnoremap <leader>f :Ack

"  work with HTML often, so I have ,ft mapped to a “fold tag” function:
nnoremap <leader>ft Vatzfuu

" This next mapping imitates TextMates Ctrl+Q function to re-hardwrap
nnoremap <leader>q gqip

" I have a ,v mapping to reselect the text that was just pasted so I can
" perform commands (like indentation) on it:
nnoremap <leader>v V`]

" quickly open up my ~/.vimrc file in a vertically split window so I can add new things to it on the fly.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

nnoremap <leader>ct :CommandTFlush<CR>

set whichwrap+=<,>,[,]

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

command! LargeFont :set guifont=Menlo:h18
command! SmallFont :set guifont=Menlo:h11

if &t_Co > 2 || has("gui_runing")
  syntax on
endif

noremap <Leader>d <Esc>:call CleanClose(1)<CR>

" http://vim.wikia.com/wiki/Search_for_visually_selected_text
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


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


