set mouse=a
set mousehide
set encoding=utf-8
set number 
set noswapfile
set nobackup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set smarttab
set relativenumber
set nowrap
syntax on
filetype on
set fileformat=unix

call plug#begin()
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

"Theme
colorscheme 
colorscheme tokyonight-moon

"For Telescope
nnoremap ,ff <cmd>Telescope find_files<cr>
nnoremap ,fg <cmd>Telescope live_grep<cr>

"For Tree
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_liststyle = 3

"For Terminal
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

" lua

lua << EOF
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    
      override_generic_sorter = true,  
      override_file_sorter = true,    
      case_mode = "smart_case",        
    }
  }
}

require('lualine').setup()
require('telescope').load_extension('fzf')
require("toggleterm").setup()

EOF


