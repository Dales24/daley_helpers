# Shared shell aliases — sourced from .zshrc

# --- Navigation ---
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -la'

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

# --- Docker / Compose ---
alias d='docker'
alias dps='docker ps'
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'
alias dcb='docker compose build'

# --- Kubernetes ---
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kaf='kubectl apply -f'
alias kak='kubectl apply -k'
alias klo='kubectl logs -f'
alias kctx='kubectl config use-context'

# --- Terraform ---
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfv='terraform validate'
alias tff='terraform fmt -recursive'

# --- Python / testing ---
alias pytest='python3 -m pytest -q'
alias cov='python3 -m pytest --cov --cov-report=term-missing'
alias fmt='black .'
alias lint='flake8 .'

# --- Misc ---
alias reload='source ~/.zshrc'
alias ports='lsof -iTCP -sTCP:LISTEN -n -P'
