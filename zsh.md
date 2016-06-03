zsh設定
========

設定ファイルの読み込み順序
--------------------------

| ファイル      | login shell | interactive shell | shell script |
|:--------------|:-----------:|:-----------------:|:------------:|
| /etc/zshenv   | :o:         | :o:               | :o:          |
| ~/.zshenv     | :o:         | :o:               | :o:          |
| /etc/zprofile | :o:         | :x:               | :x:          |
| ~/.zprofile   | :o:         | :x:               | :x:          |
| /etc/zshrc    | :o:         | :x:               | :x:          |
| ~/.zshrc      | :o:         | :x:               | :x:          |
| /etc/zlogin   | :o:         | :x:               | :x:          |
| ~/.zlogin     | :o:         | :x:               | :x:          |
| ~/.zlogout    | :o:         | :x:               | :x:          |
|  /etc/zlogout | :o:         | :x:               | :x:          |

※ `$HOME`以外に置きたい場合には`$ZDOTDIR`を指定する。
