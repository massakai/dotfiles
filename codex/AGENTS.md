# ユーザールール

## Codex 設定

- この dotfiles リポジトリでは、明示的に許可した Codex 関連ファイルだけを管理する。
- `~/.codex` 全体を Git に追加しない。認証情報、ログ、セッション、キャッシュ、ローカル状態、SQLite データベースが含まれるため。
- 公開して問題ないユーザー指示は `codex/AGENTS.md` に書き、`~/.codex/AGENTS.md` へ symlink する。
- 公開して問題ない共通設定は `codex/config.toml` に書く。
- ローカルパス、trusted projects、認証・セッション・キャッシュ・実行環境に依存する設定は `~/.codex/config.local.toml` に置く。
- `~/.codex/config.toml` は `setup/codex.sh` で `codex/config.toml` と `~/.codex/config.local.toml` を merge して生成する。
- 秘密情報を含む可能性がある設定は、実ファイルではなく local override か `*.example` のようなサンプルとして管理する。

## Git / SSH

- SSH 秘密鍵から passphrase を外す提案はしない。
- GitHub への SSH 操作では、push 前に GitHub 用の鍵が `ssh-agent` で利用可能か確認する。
- 可能なら `ssh-add -T ~/.ssh/github.pub` を優先する。使えない場合は `ssh-add -l` で読み込み済みの鍵を確認する。
- macOS では Keychain と連携した `ssh-agent` の利用を優先する。
- macOS で GitHub 用の鍵が読み込まれていない場合は、ユーザーに Terminal で次のコマンドを実行するよう案内する。

  ```sh
  ssh-add --apple-use-keychain ~/.ssh/github
  ```

- agent に鍵がない、または passphrase 入力ができないために SSH push が失敗した場合は、鍵ファイルは存在するが agent で unlock されていない状態だと説明する。
- `Permission denied (publickey)` の後は、agent や Keychain の状態が変わるまで SSH push を繰り返し試さない。
