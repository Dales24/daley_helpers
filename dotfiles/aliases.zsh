# Shared shell aliases — sourced from .zshrc

# --- Navigation ---
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lah'

# --- Git ---
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gcm='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate -20'

# --- Python ---
alias py='python3'
alias venv='python3 -m venv .venv && source .venv/bin/activate'
alias activate='source .venv/bin/activate'

# --- Misc ---
alias reload='source ~/.zshrc'
alias ports='lsof -iTCP -sTCP:LISTEN -n -P'
