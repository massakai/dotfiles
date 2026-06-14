#!/bin/zsh

if [ -z "${REPOSITORY_ROOT_DIR:-}" ]; then
  SCRIPT_DIR=$(cd $(dirname ${(%):-%N}) && pwd)
  REPOSITORY_ROOT_DIR=$(cd "${SCRIPT_DIR}/.." && pwd)
fi

OUTPUT_CONFIG="${HOME}/.codex/config.toml"
TMP_CONFIG=$(mktemp "${TMPDIR:-/tmp}/codex-config.XXXXXX.toml")

mkdir -p ~/.codex
mkdir -p ~/.agents
ln -sfn ${REPOSITORY_ROOT_DIR}/codex/AGENTS.md ~/.codex/AGENTS.md
ln -sfn ${REPOSITORY_ROOT_DIR}/codex/skills ~/.agents/skills

if [ -f "${OUTPUT_CONFIG}" ]; then
  cp "${OUTPUT_CONFIG}" "${TMP_CONFIG}"
fi

python3 "${REPOSITORY_ROOT_DIR}/codex/bin/render-config.py" \
  "${REPOSITORY_ROOT_DIR}/codex/config.toml" \
  "${HOME}/.codex/config.local.toml" \
  "${TMP_CONFIG}"

if [ -f "${OUTPUT_CONFIG}" ]; then
  BACKUP_CONFIG="${OUTPUT_CONFIG}.$(date +%Y%m%d-%H%M%S).bak"
  cp "${OUTPUT_CONFIG}" "${BACKUP_CONFIG}"
  echo "Backed up ${OUTPUT_CONFIG} to ${BACKUP_CONFIG}"
  echo "Diff for ${OUTPUT_CONFIG}:"
  diff -u "${OUTPUT_CONFIG}" "${TMP_CONFIG}" || true
fi

mv "${TMP_CONFIG}" "${OUTPUT_CONFIG}"
