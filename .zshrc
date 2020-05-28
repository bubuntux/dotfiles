source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle alias-finder
ZSH_ALIAS_FINDER_AUTOMATIC=true

antigen bundle archlinux
antigen bundle bgnotify
antigen bundle cargo
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle copydir
antigen bundle copyfile
antigen bundle cp
antigen bundle docker-compose
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle gitignore
antigen bundle golang
antigen bundle history
antigen bundle httpie
antigen bundle rust
antigen bundle rustup
antigen bundle rsync
antigen bundle sudo

antigen bundle timer
TIMER_FORMAT='[%d]' 
TIMER_PRECISION=2 

antigen bundle z

antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one

# vim
alias v=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR
alias :q=exit
alias :wq=exit
alias :q!=exit

# yay
alias yaylist='yay -Qet'
alias yayc='yay -Yc'

# Work
if [[ -f /work/bashrc ]]; then
	alias sw='source /work/bashrc'
fi

# Theme
echo $USER@$HOST  $(uname -srm) 

PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b " 
PROMPT+='$(git_prompt_info)'
PROMPT+=">%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " 

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
