# codex ディレクトリ運用ルール

- この dotfiles リポジトリでは、明示的に許可した Codex 関連ファイルだけを管理する。
- `~/.codex` 全体を Git に追加しない。認証情報、ログ、セッション、キャッシュ、ローカル状態、SQLite データベースが含まれるため。
- 公開して問題ないグローバル AI 向けルールは `codex/global-AGENTS.md` に書き、`~/.codex/AGENTS.md` へ symlink する。
- スキル本体は [massakai/agent-skills](https://github.com/massakai/agent-skills) リポジトリで管理する。dotfiles 側では管理せず、ローカルの `~/.agents/skills` に配置して使う。
- 公開して問題ない共通設定は `codex/config.toml` に書く。
- ローカルパス、trusted projects、認証・セッション・キャッシュ・実行環境に依存する設定は `~/.codex/config.local.toml` に置く。
- `~/.codex/config.toml` は `setup/codex.sh` で `codex/config.toml` と `~/.codex/config.local.toml` を merge して生成する。
- 秘密情報を含む可能性がある設定は、実ファイルではなく local override か `*.example` のようなサンプルとして管理する。
- `context-mode` は Codex profile ではなく plugin として扱う。共有側では必要な feature flag と setup 導線だけを管理し、marketplace 追加・plugin install・hook trust はローカルセットアップ時に行う。
