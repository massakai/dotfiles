#!/bin/zsh

if [ "$SHELL" != "/bin/zsh" ]; then
    info "change shell (zsh)"
    chsh -s /bin/zsh $USER
fi

cat << EOS > ~/.zshenv
ZDOTDIR=${REPOSITORY_ROOT_DIR}/zsh
. \${ZDOTDIR}/.zshenv
EOS
