source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
	zgen oh-my-zsh
	zgen oh-my-zsh plugins/alias-finder
	zgen oh-my-zsh plugins/archlinux
	zgen oh-my-zsh plugins/bgnotify
	zgen oh-my-zsh plugins/cargo
	zgen oh-my-zsh plugins/colored-man-pages
	zgen oh-my-zsh plugins/command-not-found
	zgen oh-my-zsh plugins/common-aliases
	zgen oh-my-zsh plugins/copydir
	zgen oh-my-zsh plugins/copyfile
	zgen oh-my-zsh plugins/cp
	zgen oh-my-zsh plugins/docker-compose
	zgen oh-my-zsh plugins/docker
	zgen oh-my-zsh plugins/extract
	zgen oh-my-zsh plugins/git
	zgen oh-my-zsh plugins/gitignore
	zgen oh-my-zsh plugins/golang
	zgen oh-my-zsh plugins/history
	zgen oh-my-zsh plugins/httpie
	zgen oh-my-zsh plugins/rust
	zgen oh-my-zsh plugins/rustup
	zgen oh-my-zsh plugins/rsync
	zgen oh-my-zsh plugins/sudo
	zgen oh-my-zsh plugins/timer
	zgen oh-my-zsh plugins/z

	zgen load zsh-users/zsh-syntax-highlighting
	zgen load zsh-users/zsh-autosuggestions
	zgen load zsh-users/zsh-completions src
	zgen load zsh-users/zsh-history-substring-search

	zgen save
fi

ZSH_ALIAS_FINDER_AUTOMATIC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

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
[[ -f /work/bashrc ]] && alias sw='source /work/bashrc'

# Theme
echo $USER@$HOST  $(uname -srm)

PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b "
PROMPT+='$(git_prompt_info)'
PROMPT+=">%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

TIMER_FORMAT='[%d]'
TIMER_PRECISION=2
