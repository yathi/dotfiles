"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yathi/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/yathi/.cache/dein')
  call dein#begin('/Users/yathi/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/yathi/.cache/dein/repos/github.com/Shougo/dein.vim')
  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-airline/vim-airline')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('rust-lang/rust.vim')
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('neovimhaskell/haskell-vim')
  call dein#add('tjvr/vim-nearley')
  call dein#add('rakr/vim-one')
  call dein#add('mhartington/oceanic-next')
  call dein#add('gruvbox-community/gruvbox')
  call dein#add('sainnhe/gruvbox-material')
  call dein#add('scrooloose/nerdtree')
  call dein#add('mileszs/ack.vim')
  call dein#add('mustache/vim-mustache-handlebars')
  call dein#add('tpope/vim-commentary')
  call dein#add('machakann/vim-highlightedyank')
  call dein#add('neovim/nvim-lsp')
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('wincent/terminus')
  call dein#add('dyng/ctrlsf.vim')
  call dein#add('thoughtbot/vim-rspec')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-rails')
  call dein#add('907th/vim-auto-save')
  call dein#add('dense-analysis/ale')

  " if you have to remove disabled 
  " call map(dein#check_clean(), "delete(v:val, 'rf')")
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
"
" filetype off
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" To show invisible characters
set list
" set listchars=tab:▸\ ,eol:¬
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>¬

" Set the leader
let mapleader = ","

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nmap <leader>cs ;let @*=expand("%")<CR>   " copy just the filename
nmap <leader>cl ;let @*=expand("%:p")<CR> " copy the filename with path

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Colorscheme
" " Theme
" autocmd VimEnter * colorscheme OceanicNext
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" ================ General Config ====================
" TABs and Spaces
set ts=2 sts=2 sw=2 expandtab
set number
set relativenumber
set hlsearch

" Disable search highlight when escape is pressed
" Disabling this because it makes vim start in replace mode https://github.com/vim/vim/issues/3080
" nnoremap <Esc> :nohlsearch<CR><Esc>

" Lightline replaces this so it's not needed
set noshowmode

" Show matching brackets when text indicator is over them
set showmatch

" Smart case search ignores case if search pattern is all lowercase.
" Otherwise, search is cAse-seNsItiVe
set smartcase

" Should show search matches as you type
set ignorecase
set incsearch

set autoread                    "Reload files changed outside vim

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb
" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=5       "deepest fold is 3 levels
set foldlevelstart=2
" set nofoldenable        "dont fold by default
" toggle fold using space. Move right if not a fold level
" change za to zA to open all folds recursively
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
"

" make comments italic
highlight Comment cterm=italic

if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Easier way of pressing ESC for a Dvorak user while in Insert mode
nnoremap <C-c> :nohlsearch<CR><esc>

" keybindings to put the matching braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" keybindings for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Toggle NERDTREE
map <C-n> ;NERDTreeToggle %<CR>

" lsp shortcuts
nnoremap <silent>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent><c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>

" FZF
" Default fzf layout
" - down / up / left / right
map <C-p> ;Files <CR>
map <M-p> ;Files <CR>
let g:fzf_layout = { 'down': '~80%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
" This decides the height
let g:fzf_layout = { 'window': '40new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Open files in horizontal split
nnoremap <silent> <Leader>h :call fzf#run({'down': '40%', 'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({'right': winwidth('.') / 2, 'sink':  'vertical botright split' })<CR>

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" More natural splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural splits
set splitbelow
set splitright

" airline config
let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''

" Git gutter
set updatetime=100
set signcolumn=yes

" terminal mode
"To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>


" RSpec.vim mappings
map <Leader>t ;call RunCurrentSpecFile()<CR>
map <Leader>s ;call RunNearestSpec()<CR>
map <Leader>l ;call RunLastSpec()<CR>
let g:rspec_runner = "os_x_iterm"

" CTRLSF Mappings
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" .vimrc
let g:auto_save = 1  " enable AutoSave on Vim startup

" fugitive mappings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>

" swap ; and : in visual and normal mode
nnoremap : ;
nnoremap ; :
vnoremap ; :
vnoremap : ;

" Abbrevations
ab mc :twisted_rightwards_arrows:

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL


:lua << END
require'nvim_lsp'.tsserver.setup{}
require'nvim_lsp'.solargraph.setup{}
END
