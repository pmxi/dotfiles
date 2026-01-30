alias config='/usr/bin/git --git-dir=/Users/paras/.cfg/ --work-tree=/Users/paras'
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity
export PATH="/Users/paras/.antigravity/antigravity/bin:$PATH"

# fzf config and key bindings
# Ctrl+r   history search
# Ctrl+t   file path insert
# Opt+c    cd to directory
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# experimental
# fcd() {
#     cd "$(find ~ \( \
#         -name node_modules \
#         -o -name .venv \
#         -o -name venv \
#         -o -name __pycache__ \
#         -o -name .git \
#         -o -name site-packages \
#         -o -name .npm \
#         -o -name .nvm \
#         -o -name .pyenv \
#         -o -name Caches \
#         -o -name .cache \
#         -o -path ~/Library \
#             ! -path "$HOME/Library/Mobile Documents" \
#             ! -path "$HOME/Library/Mobile Documents/com~apple~CloudDocs*" \
#         -o -path ~/.antigravity \
#         -o -path ~/.vscode \
#         -o -path ~/.gradle \
#         -o -path ~/.nuget \
#         -o -path ~/.ipfs \
#     \) -prune -o -type d -print 2>/dev/null | fzf)" && pwd && ls -la
# }

fcd() {
  cd "$(
    {
      fd . "$HOME" \
        --type d \
        --hidden \
        --exclude /Library \
        --exclude node_modules \
        --exclude .venv \
        --exclude venv \
        --exclude __pycache__ \
        --exclude .git \
        --exclude site-packages \
        --exclude .npm \
        --exclude .nvm \
        --exclude .pyenv \
        --exclude Caches \
        --exclude .cache \
        --exclude .antigravity \
        --exclude .vscode \
        --exclude .gradle \
        --exclude .nuget \
        --exclude .ipfs
      fd . "$HOME/Library/Mobile Documents" \
        --type d \
        --hidden \
        --exclude node_modules \
        --exclude .venv \
        --exclude venv \
        --exclude __pycache__ \
        --exclude .git
    } | fzf
  )" && pwd && ls -laG
}


fop() {
  local file
  file="$(
    {
      fd . "$HOME" \
        --type f \
        --hidden \
        --exclude /Library \
        --exclude node_modules \
        --exclude .venv \
        --exclude venv \
        --exclude __pycache__ \
        --exclude .git \
        --exclude site-packages \
        --exclude .npm \
        --exclude .nvm \
        --exclude .pyenv \
        --exclude Caches \
        --exclude .cache \
        --exclude .antigravity \
        --exclude .vscode \
        --exclude .gradle \
        --exclude .nuget \
        --exclude .ipfs
      fd . "$HOME/Library/Mobile Documents" \
        --type f \
        --hidden \
        --exclude node_modules \
        --exclude .venv \
        --exclude venv \
        --exclude __pycache__ \
        --exclude .git
    } | fzf
  )"
  
  if [[ -n "$file" ]]; then
    open "$@" "$file"
  fi
}


fp() {
  local file
  file="$(
    {
      fd . "$HOME" \
        --type f \
        --hidden \
        --exclude /Library \
        --exclude node_modules \
        --exclude .venv \
        --exclude venv \
        --exclude __pycache__ \
        --exclude .git \
        --exclude site-packages \
        --exclude .npm \
        --exclude .nvm \
        --exclude .pyenv \
        --exclude Caches \
        --exclude .cache \
        --exclude .antigravity \
        --exclude .vscode \
        --exclude .gradle \
        --exclude .nuget \
        --exclude .ipfs
      fd . "$HOME/Library/Mobile Documents" \
        --type f \
        --hidden \
        --exclude node_modules \
        --exclude .venv \
        --exclude venv \
        --exclude __pycache__ \
        --exclude .git
    } | fzf
  )"
  
  if [[ -n "$file" ]]; then
    echo "$file"
  fi
}

# /Users/paras/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes-pm3

function fssh() {
  local host
  host=$(grep -E "^Host\s+" ~/.ssh/config | awk '{print $2}' | grep -v '\*' | fzf --height 40% --reverse)

  if [[ -n "$host" ]]; then
    ssh "$host"
  fi
}


alias lfg='claude --dangerously-skip-permissions'
