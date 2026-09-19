# ユーザールール

## Codex 設定

- この dotfiles リポジトリでは、明示的に許可した Codex 関連ファイルだけを管理する。
- `~/.codex` 全体を Git に追加しない。認証情報、ログ、セッション、キャッシュ、ローカル状態、SQLite データベースが含まれるため。
- 公開して問題ないユーザー指示は `codex/AGENTS.md` に書き、`~/.codex/AGENTS.md` へ symlink する。
- スキル本体は [massakai/agent-skills](https://github.com/massakai/agent-skills) リポジトリで管理する。dotfiles 側では管理せず、ローカルの `~/.agents/skills` に配置して使う。
- 公開して問題ない共通設定は `codex/config.toml` に書く。
- ローカルパス、trusted projects、認証・セッション・キャッシュ・実行環境に依存する設定は `~/.codex/config.local.toml` に置く。
- `~/.codex/config.toml` は `setup/codex.sh` で `codex/config.toml` と `~/.codex/config.local.toml` を merge して生成する。
- 秘密情報を含む可能性がある設定は、実ファイルではなく local override か `*.example` のようなサンプルとして管理する。
- `context-mode` は Codex profile ではなく plugin として扱う。共有側では必要な feature flag と setup 導線だけを管理し、marketplace 追加・plugin install・hook trust はローカルセットアップ時に行う。

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

## GitHub 運用

- GitHub での作業は `gh` を前提にする。URL を開いて手作業で確認・操作する前に、まず `gh` で確認・操作できるかを検討する。
- GitHub での作業を始める前に `gh auth status` でログイン状態を確認する。認証が切れている場合は、先に `gh` の認証を復旧してから進める。
- GitHub の Issue、PR、review へ外部コメントを投稿するには、ユーザーの明示的な
  承認と対象リポジトリの規約確認を要する。Codex が投稿するコメントは必ず
  `> 🤖 **Codex Agent Comment**` で開始し、人間の意図を代弁せず、分析、実施した
  変更、検証結果を事実として記述する。PR 本文、コミットメッセージ、ローカル会話は
  対象外である。
- Codex は review thread を resolve しない。対応内容を確認して thread を解決する
  責任は、コメント投稿者にある。
- 特に明示的な指示がない限り、新しい worktree を作成する前にローカルのデフォルトブランチが `master` か `main` かを確認し、そのブランチを最新の状態に更新したうえで、そのデフォルトブランチから直接 worktree を作成する。
- ブランチごとの作業は `git worktree` 上で行う。既存の作業ディレクトリを使い回すより、必要に応じて worktree を追加して分離することを優先する。
- 使い終わった worktree は、未コミット変更がないことを確認してから `git worktree remove` で削除する。ディレクトリを直接 `rm -rf` しない。
- ここでいう未コミット変更には、追跡済みファイルの変更だけでなく未追跡ファイルも含む。`git status` が clean なことを削除前の基準にする。
- worktree を削除したあとは、必要に応じて `git worktree prune` を実行して不要な管理情報を掃除する。
- PR のマージ後などで不要になった作業ブランチは、worktree の削除後に整理する。
- 変更が残っている worktree を掃除したい場合は、削除前に commit・stash・破棄のどれにするかを明示して判断する。
