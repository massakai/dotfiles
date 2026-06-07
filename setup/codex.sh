#!/bin/zsh

mkdir -p ~/.codex
ln -sfn ${REPOSITORY_ROOT_DIR}/codex/AGENTS.md ~/.codex/AGENTS.md

python3 "${REPOSITORY_ROOT_DIR}/codex/bin/render-config.py" \
  "${REPOSITORY_ROOT_DIR}/codex/config.toml" \
  "${HOME}/.codex/config.local.toml" \
  "${HOME}/.codex/config.toml"
