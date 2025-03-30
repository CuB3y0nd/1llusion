# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# variables
export KEYTIMEOUT=1
export EDITOR="nvim"
export VISUAL="${EDITOR}"
export BROWSER="firefox"
export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|cd -|cd ..)"
export BAT_THEME="Coldark-Dark"
export GOPROXY=https://goproxy.io,direct
export ALL_PROXY=http://127.0.0.1:2080
export PATH="$HOME/.cargo/bin:$PATH"

if [[ -d "$HOME/.local/bin" ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zsh-users/zsh-history-substring-search \
    zdharma-continuum/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
    Aloxaf/fzf-tab

# load completions
autoload -Uz compinit

fpath+=/usr/share/zsh/site-functions

if [[ -n $ZSH_COMPDUMP ]]; then
  compinit -C -d $ZSH_COMPDUMP
else
  compinit -d ~/.config/zsh/zcompdump
fi

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zinit cdreplay -q

# basic auto/tab complete:
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    '+r:|[._-]=* r:|=*' \
    '+l:|=*'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats '%F{green}%b%u%c%f '
zstyle ':vcs_info:*' actionformats '%F{green}%b|%a%u%c%f '
zstyle ':fzf-tab:*' fzf-flags --style=full --height=90% --pointer '>' \
    --color 'pointer:green:bold,bg+:-1:,fg+:green:bold,info:blue:bold,marker:yellow:bold,hl:gray:bold,hl+:yellow:bold' \
    --input-label ' Search ' --color 'input-border:blue,input-label:blue:bold' \
    --list-label ' Results ' --color 'list-border:green,list-label:green:bold' \
    --preview-label ' Preview ' --color 'preview-border:magenta,preview-label:magenta:bold'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter
zmodload zsh/complist

# edit current command in your editor
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# command history
HISTFILE="$HOME/.config/zsh/zhistory"
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt AUTOCD             # change directory just by typing its name
setopt PROMPT_SUBST       # enable command substitution in prompt
setopt MENU_COMPLETE      # automatically highlight first element of completion menu
setopt LIST_PACKED        # the completion menu takes less space
setopt AUTO_LIST          # automatically list choices on ambiguous completion
setopt COMPLETE_IN_WORD   # complete from both ends of a word

# set prompt style
PS1='λ %B%F{red}%~/ %f%b${vcs_info_msg_0_}'

# dynamically change terminal title
function xterm_title_precmd() {
  print -Pn -- '\e]2;%n@%m %~\a'
  [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec() {
  print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
  [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (kitty*|alacritty*|tmux*|screen*|xterm*) ]]; then
  add-zsh-hook -Uz precmd xterm_title_precmd
  add-zsh-hook -Uz preexec xterm_title_preexec
fi

# switch directory with ranger
yazicd() {
  tmp="$(mktemp)"
  yazi --cwd-file "$tmp" "$@"

  if [ -s "$tmp" ]; then
    dir="$(<"$tmp")"
    rm -f "$tmp"

    if [ "$dir" != "$(pwd)" ]; then
      cd "$dir" || return
    fi
  else
    rm -f "$tmp"
  fi
}

# load aliases and shortcuts if existent
[ -f "$HOME/.config/zsh/shortcutrc" ] && source "$HOME/.config/zsh/shortcutrc"
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"

# miscs
$HOME/.local/bin/colorscript -r
