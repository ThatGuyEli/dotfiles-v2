# starship prompt
eval "$(starship init zsh)"

# aliases (todo: be imported from another script)
alias ls="exa -lah --git --color=always --group-directories-first --time-style=long-iso"
alias ..="cd .."

# prevent duplicates in ~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS