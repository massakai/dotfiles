set helplang=ja

" encodings
set enc-utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,enc-jp,cp932

set autoindent
set smartindent
set backspace=indent,eol,start
set expandtab
"set hlsearch
set paste
set shiftwidth=4
set tabstop=4
" タブ、空白、改行の表示
"set list
" 全角スペースの表示
:highlight zenkakuda ctermbg=7
" カレント行のハイライト
set cursorline
" ルーラーを表示
set ruler
syntax on

imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>

" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge
" 保存時に行末の$を削除する
"autocmd BufWritePre * :%s/\$\+$//ge
