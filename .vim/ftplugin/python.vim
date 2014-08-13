setl textwidth=80
setl expandtab
setl tabstop=4
setl shiftwidth=4
setl softtabstop=4

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
