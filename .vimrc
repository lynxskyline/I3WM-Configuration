" 1. GENERAL SETTINGS

syntax on
set encoding=utf-8
set fileencoding=utf-8
set number
set relativenumber
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set breakindent
set wrap
set laststatus=2
set termguicolors
set background=dark
filetype plugin indent on
set undofile
set ignorecase
set smartcase
set incsearch
set hlsearch
set cmdheight=1

" 2. INSERT MODE MAPPINGS

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap { {}<Left>

inoremap jk <Esc>
inoremap jj <Esc>

" 3. NORMAL MODE MAPPINGS

nnoremap L :tabnext<CR>
nnoremap H :tabprevious<CR>
nnoremap <A-r> <C-r>

" 4. PLUGINS

if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

let g:airline_extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
colorscheme onedark

" 5. HIGHLIGHT
highlight CocErrorSign ctermfg=Red guifg=#ff0000
highlight CocWarningSign ctermfg=Brown guifg=#ffaa00

" PENGATURAN TOMBOL UNTUK AUTOCOMPLETE & SNIPPET (Mencegah Tabrakan)

let g:UltiSnipsExpandTrigger="<Nop>"

" Geser ke placeholder snippet berikutnya/sebelumnya tetap menggunakan Tab setelah kode masuk
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Perbaikan: TAB sekarang digunakan untuk KONFIRMASI (memasukkan saran teks) jika menu muncul
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Pengaturan Arrow (Panah): Menggunakan panah atas dan bawah untuk navigasi menu pop-up
inoremap <silent><expr> <Down> coc#pum#visible() ? coc#pum#next(1) : "\<Down>"
inoremap <silent><expr> <Up>   coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Membuat menu pop-up autocomplete menjadi abu-abu gelap estetik
highlight CocPumMenu ctermbg=235 guibg=#2c313c
" Membuat teks yang sedang disorot/dipilih menjadi biru khas VS Code
highlight CocPumSearch ctermfg=4 guifg=#61afef

