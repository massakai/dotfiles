# 設定ファイルの設置を行う

define setup
	@if [ ! -e $1 ]; then echo "$1 does not exists"; fi
	@if [ -e $2 ]; then echo "$2 already exists"; fi

	@# create symboric link
	@if [ -e $1 -a ! -e $2 ]; then ln -s $1 $2; fi
endef

.PHONY: all
all: setup_zsh setup_vim setup_screen

.PHONY: setup_zsh
setup_zsh:
	@echo 'setup zsh config'
	$(call setup, zsh/.zshenv, ~/.zshenv)
	$(call setup, zsh/.zshrc, ~/.zshrc)

.PHONY: setup_vim
setup_vim:
	@echo 'setup vim config'
	$(call setup, vim/.vimrc, ~/.vimrc)

.PHONY: setup_screen
setup_screen:
	@echo 'setup screen config'
	$(call setup, screen/.screenrc, ~/.screenrc)

