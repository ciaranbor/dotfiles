syntax on

set noerrorbells
set nu
set relativenumber

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set smartcase
set incsearch
set scrolloff=8
set signcolumn=yes

set hidden
set updatetime=300
set shortmess+=c

set viminfo='20,<1000,s1000

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'kjwon15/vim-transparent'
Plug 'dbeniamine/cheat.sh-vim'

call plug#end()

silent! colorscheme gruvbox
set background=dark

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \     'gitbranch': 'FugitiveHead'
      \ },
      \ }

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let mapleader = " "
nnoremap <Leader>u :UndotreeShow<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Git diff %<CR>
nnoremap <Leader>ga :Git add %<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gf :Git commit --amend<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gr :Git checkout -- %<CR>
nnoremap <Leader>gl :Git log<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>rg :Rg<CR>

" COC

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jt <Plug>(coc-type-definition)
nmap <silent> <leader>ji <Plug>(coc-implementation)
nmap <silent> <leader>jr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>jf  <Plug>(coc-format-selected)
nmap <leader>jf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ja  <Plug>(coc-codeaction-selected)
nmap <leader>ja  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>jF  <Plug>(coc-fix-current)

let g:coc_global_extensions = ['coc-clangd', 'coc-cmake', 'coc-fzf-preview', 'coc-git', 'coc-go', 'coc-markdownlint', 'coc-python', 'coc-sh', 'coc-texlab', 'coc-yaml', 'coc-java']
