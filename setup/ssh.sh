#!/bin/zsh

if [ -d $DROPBOX_HOME/Backup/.ssh -a ! -L ~/.ssh ]
then
    ln -sf $DROPBOX_HOME/Backup/.ssh ~/.ssh
else
    mkdir -p ~/.ssh
fi

ln -sf ${REPOSITORY_ROOT_DIR}/.ssh/config          ~/.ssh/config
ln -sf ${REPOSITORY_ROOT_DIR}/.ssh/authorized_keys ~/.ssh/authorized_keys


# 秘密鍵を生成する。
# 公開鍵は手動でサービスに登録する。
if [ ! -f ~/.ssh/github ]; then
    info "Generate github SSH key"
    ssh-keygen -t ed25519 -f ~/.ssh/github \
        -C "github key for $(whoami)@$(hostname) on $(date +%Y-%m-%d)"
fi
if [ ! -f ~/.ssh/bitbucket ]; then
    info "Generate bitbucket SSH key"
    ssh-keygen -t rsa -b $((1024 * 8)) -f ~/.ssh/bitbucket \
        -C "bitbucket key for $(whoami)@$(hostname) on $(date +%Y-%m-%d)"
fi
