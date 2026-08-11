if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init - --no-rehash zsh)"
fi

if [ -f "${HOME}/.zprofile.local" ]; then
    source "${HOME}/.zprofile.local"
fi

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
