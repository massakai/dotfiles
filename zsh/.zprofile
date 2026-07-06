if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init - --no-rehash zsh)"
fi

if [ -f "${HOME}/.zprofile.local" ]; then
    source "${HOME}/.zprofile.local"
fi
