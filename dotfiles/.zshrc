# ~/.zshrc — mock starter. Symlink with: ln -sf "$PWD/dotfiles/.zshrc" ~/.zshrc

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS

# --- Prompt (simple: dir + git branch) ---
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%1~%f%F{yellow}${vcs_info_msg_0_}%f $ '

# --- PATH ---
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# --- Tooling ---
export EDITOR="vim"
export CLICOLOR=1

# --- Load shared aliases ---
[ -f "${0:A:h}/aliases.zsh" ] && source "${0:A:h}/aliases.zsh"

# --- pyenv / nvm (uncomment if installed) ---
# eval "$(pyenv init -)"
# export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
