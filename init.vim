call plug#begin('~/.vim/plugged')
    Plug 'xuhdev/vim-latex-live-preview'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'famiu/bufdelete.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'justinmk/vim-sneak'
    Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
    " ***HIGHLIGHTING***
    Plug 'tomlion/vim-solidity'
    Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do': ':TSUpdate' }
    " ***AUTO COMPLETE***
    Plug 'windwp/nvim-ts-autotag'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'github/copilot.vim'
    " ***COLORSCHEMES***
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/everforest'
    " ***AESTHETIC***
    Plug 'romgrk/barbar.nvim'
    Plug 'sunjon/shade.nvim'
    Plug 'xiyaowong/nvim-transparent'
    Plug 'luukvbaal/stabilize.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'rcarriga/nvim-notify'
call plug#end()

lua require'pluginsettings'.initialize()

" General settings
let mapleader=' '
set number
set hidden
set relativenumber
set tabstop=4
set shiftwidth=4
set termguicolors
set expandtab
set mouse=a
set splitbelow
colorscheme gruvbox-material
hi StatusLine ctermbg=0 ctermfg=209  guibg=None
hi BufferTabpageFill guibg=None
hi BufferCurrent guibg=None
hi BufferCurrentMod guibg=None
hi BufferCurrentSign guibg=None
hi BufferInactive guibg=None
hi BufferInactiveMod guibg=None
hi BufferInactiveSign guibg=None
let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_change_directory=0
let g:ale_python_flake8_change_directory=0

"nvim tree settings
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_git_hl = 1
"next line for barbar 
let g:nvim_tree_quit_on_open = 0 

"barbar settings
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.closable = v:false
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

"floaterm settings
let g:floaterm_height=0.9
let g:floaterm_width=0.9

" Auto Pair settings
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}


" Tab for autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" LaTeX Live Preview
let g:livepreview_previewer = 'zathura'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" KEYBINDINGS
" General
let mapleader = " "
nnoremap <TAB> :BufferNext<CR>
nnoremap <S-TAB> :BufferPrevious<CR>
nnoremap <leader>q :BufferClose<CR>
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k

" Nvim tree
"nnoremap <C-n> :lua require'nvimtreebarbar'.toggle_tree()<CR>
nnoremap <C-n> :NvimTreeToggle<CR>

" toggleterm.nvim
nnoremap <leader>t :ToggleTerm size=10<CR>
nnoremap <leader>g :lua _lazygit_toggle()<CR>i

"telescope
nnoremap <leader>s :Telescope<CR>

" Python 
"autocmd FileType python nmap <buffer> <leader>r :w<CR>:split<CR>:term python %<CR>
"autocmd FileType python nmap <buffer> <leader>r :w<CR>:FloatermNew python %<CR>
autocmd FileType python nmap <buffer> <leader>r :w<CR>:2TermExec direction='float' cmd='python %'<CR>
autocmd FileType python nnoremap <silent> <leader>R  {jV}k:<C-u>MagmaEvaluateVisual<CR>
autocmd FileType python nnoremap <silent> <leader>Rr :MagmaEvaluateLine<CR>
autocmd FileType python xnoremap <silent> <leader>R  :<C-u>MagmaEvaluateVisual<CR>
autocmd FileType python nnoremap <silent> <leader>Rc :MagmaReevaluateCell<CR>
autocmd FileType python nnoremap <silent> <leader>Rd :MagmaDelete<CR>
autocmd FileType python nnoremap <buffer> <leader>Ro :MagmaShowOutput<CR>
autocmd FileType python nnoremap <silent> <leader>c i#------------Test------------#<ESC>bbcw

