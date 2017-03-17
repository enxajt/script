########################################
# 環境変数
########################################
export LANG=ja_JP.UTF-8

########################################
# color
########################################
export TERM="xterm-256color"
#autoload colors
autoload -Uz colors
colors

########################################
# view
########################################
# historyに日付を表示
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

########################################
# prompt
########################################
# git設定
#RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
#RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# %H ホスト名  # %m ホスト名のうち最初のドットの前まで
# %d pwd  # %~ pwd(ホームの場合~)
# %n ユーザ名
# %D YY-MM-DD  # %T HH:MM  # %* HH:MM:SS
# %# 一般ユーザなら%、スーパーユーザなら#
PROMPT="
[%*] [%(?.%{${fg[blue]}%}.%{${fg[green]}%})%n${reset_color}@${fg[blue]}%m${reset_color}] %~"
PROMPT=$PROMPT'${vcs_info_msg_0_}'
PROMPT=$PROMPT"
%# "

# PROMPT="
# [%*] [%n@%m] %~ "
# PROMPT=$PROMPT'${vcs_info_msg_0_}'
# PROMPT=$PROMPT"
# %# "

#PROMPT='[%n@%m] %~ %# '

# PROMPT2 ２行以上のプロンプトで表示される。パイプ時とか。
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
# SPROMPT 入力したコマンドが、打ち間違いなどで見つからない時に表示される「もしかして」
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"

########################################
# 単語区切り
########################################
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default

# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# completions
########################################
fpath=(/usr/local/share/zsh-completions $fpath)

# 補完機能を有効にする
# rm -f ~/.zcompdump; compinit
autoload -Uz compinit
compinit -u
#compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

########################################
# other
########################################
# beep を無効にする
setopt no_beep

# '#' 以降をコメントとして扱う
setopt interactive_comments

# cd したら自動的にpushdする
# ディレクトリスタックにディレクトリのパスを保存するには pushd
# ディレクトリスタックの状態を確認するには dirs
# ディレクトリスタックのパスを削除するには popd 
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# cdの後にlsを実行
chpwd() { ls -ltr --color=auto }

# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
setopt histignorealldups
# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# ウインドウ名の表示
set -g set-titles on
set -g set-titles-string '#W'

# コマンドミスを修正
setopt correct

########################################
# キーバインド
########################################
# vim風キーバインドにする
bindkey -v

# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# backspace,deleteキーを使えるように
stty erase ^H
bindkey "^[[3~" delete-char
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

########################################
# エイリアス
########################################
alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias so='source'
alias v='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias c='cdr'
# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

########################################
# C で標準出力をクリップボードにコピーする
########################################
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

if [ -d "/vagrant/shared/impress/mdpress" ] ; then
  PATH="$PATH:/vagrant/shared/impress/mdpress"
fi
