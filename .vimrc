"show line number
:set number

"ESC -> jk
inoremap jk <Esc>

"color=?
set background=dark
syntax enable
let g:solarized_termcolors=256
"colorscheme PaperColor

"turn on underscore
set cursorline

"turn on search highlight
set hlsearch

if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

"turn off backup
set nobackup

" add tab space
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"Font=?
set encoding=utf-8
set ambiwidth=double
set guifont=Consolas:h11:cANSI
set guifontwide=DotumChe:h11:cANSI

"shutdown backup
set nobackup

"自动补全括号
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O

"设置跳出自动补全的括号
func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunc
" 将tab键绑定为跳出括号
inoremap <TAB> <c-r>=SkipPair()<CR>

"tab switch shortcut key settings
"":nn <M-1> 1gt
"":nn <M-2> 2gt
"":nn <M-3> 3gt
"":nn <M-4> 4gt
"":nn <M-5> 5gt
"":nn <M-6> 6gt
"":nn <M-7> 7gt
"":nn <M-8> 8gt
"":nn <M-9> 9gt
"":nn <M-0> :tablast<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'voldikss/vim-floaterm'
""Plug 'junegunn/fzf.vim'
""Plug 'preservim/nerdtree'
""Plug 'rust-lang/rust.vim'
call plug#end()

" floaterm keymap
noremap  <leader>t  :FloatermToggle<CR>
noremap! <leader>t  <Esc>:FloatermToggle<CR>
tnoremap <leader>t  <C-\><C-n>:FloatermToggle<CR>
