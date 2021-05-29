" ~/.config/nvim/init.vim
" https://github.com/technologeli/dotfiles-v2

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set relativenumber
set number
set nohlsearch
set incsearch
set noswapfile
set nobackup
set undofile
set undodir=~/.local/share/nvim/undo
set noerrorbells
set nowrap
set hidden
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set mouse=a
set termguicolors
set cursorline

call plug#begin('~/.local/share/nvim/plugged')

" Theming
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Theming
colorscheme onedark
highlight Normal guibg=none

let g:lightline = {
    \ 'colorscheme': 'onedark'
    \ }

" LSP
" This prevents it from instantly replacing because that's annoying
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
-- lua comment lol
-- python
require'lspconfig'.pyright.setup{
    on_attach=require'completion'.on_attach
}
require'lspconfig'.tsserver.setup{
    on_attach=require'completion'.on_attach
}
EOF

" netrw
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_bufsettings = 'noma nomod nu rnu nowrap ro nobl'

let mapleader = ' '
" CTRL+Backspace deletes a full word
inoremap <C-H> <C-W>

" Terminal
" Normal mode using CTRL+[
tnoremap <C-[> <C-\><C-n>

" Quickfix Lists
nnoremap <C-k>      <cmd>cnext<cr>zz
nnoremap <c-j>      <cmd>cprev<cr>zz
nnoremap <leader>k  <cmd>lnext<cr>zz
nnoremap <leader>j  <cmd>lprev<cr>zz
nnoremap <C-q>      <cmd>call ToggleQFList(1)<cr>
nnoremap <leader>q  <cmd>call ToggleQFList(0)<cr>

let g:qfl = 0
let g:qfg = 0

fun! ToggleQFList(global)
    if a:global
        if g:qfg == 1
            let g:qfg = 0
            cclose
        else
            let g:qfg = 1
            copen
        end
    else
        if g:qfl == 1
            let g:qfl = 0
            lclose
        else
            let g:qfl = 1
            lopen
        end
    endif
endfun

" Telescope
highlight TelescopeSelectionCaret guifg=#61afef
highlight TelescopeSelection      guifg=#abb2bf gui=bold
highlight TelescopeBorder         guifg=#c678dd
highlight TelescopeMatching       guifg=#e5c07b
highlight TelescopePromptPrefix   guifg=#61afef

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--hidden',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        -- layout_strategy = "horizontal"
        layout_defaults = {
            horizontal = {
                preview_width = 0.6
            }
        },
        mappings = {
            i = {
            },
            n = {
                ["l"] = actions.select_default + actions.center
            }
        }
   }
}
EOF

" Default Mappings
" <C-x> open in a hsplit
" <C-v> open in a vsplit
" <C-t> open in a new tab

" Use telescope for search queries, git projects, working directories, general
" directories, dotfiles, and buffers.
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({search=vim.fn.input("Grep For > ")})<cr>
nnoremap <C-p>      <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>f  <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
nnoremap <C-f>      <cmd>lua require('telescope.builtin').find_files({hidden=true, search_dirs={"~/.dotfiles", "~/school", "~/work", "~/personal"}})<cr>
nnoremap <leader>.  <cmd>lua require('telescope.builtin').find_files({hidden=true, search_dirs={"~/.dotfiles"}})<cr>
nnoremap <C-b>      <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>b  <cmd>lua require('telescope.builtin').buffers()<cr>
