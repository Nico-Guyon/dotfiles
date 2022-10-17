# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# theme selection
set -g theme_color_scheme gruvbox

# personal custom aliases
#  paths
alias mhp="cd ~/work/HT"
alias mclub="cd ~/work/clubvtc"
alias mdot="cs ~/.config"
alias mvi="cd ~/.config/nvim"
alias mfish="cd ~/.config/fish/conf.d"
#  vim
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias vs="nvim -S Session.vim"
#  ls
alias ll="exa -l -g --icons"
alias l="exa -l -g --icons"
alias lla="ll -alh"
#  git
alias gd="git diff"
alias gs="git status"
alias gc="git commit -a"
alias gb="git branch"
# miscs
# alias ssh="kitty +kitten ssh"
alias intel="arch -x86_64"

# fish vim mode
fish_vi_key_bindings
fish_vi_cursor
set fish_key_bindings fish_user_key_bindings

# fish ssh agent
fish_ssh_agent

# UTF-8 support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end

# # Emulates vim's cursor shape behavior
# # Set the normal and visual mode cursors to a block
# set fish_cursor_default block
# # Set the insert mode cursor to a line
# set fish_cursor_insert line
# # Set the replace mode cursor to an underscore
# set fish_cursor_replace_one underscore
# # The following variable can be used to configure cursor shape in
# # visual mode, but due to fish_cursor_default, is redundant here
# set fish_cursor_visual block

# source ~/.tmux.conf

set ANDROID_HOME $HOME/Library/Android/sdk/
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/platform-tools
set PATH /opt/homebrew/bin $PATH

alias braw="/opt/homebrew/bin/brew"
alias brow="arch -x86_64 /usr/local/Homebrew/bin/brew"
alias cat="nvimpager"
alias diff="v -d"
alias sim="/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator"

# aliases for yarn
alias yt="yarn test"
alias ytt="yarn types"
alias yw="yarn watch"
alias yd="yarn dev"
alias yr="yarn restart"
alias ysr="yarn start_rewired"

# django aliases
alias pm="python manage.py"
alias pes="pipenv shell"

# tmux aliases
alias tls="tmux ls"
alias ta="tmux attach-session -t "

set -U FZF_ENABLE_OPEN_PREVIEW 1

# python pyenv init
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
set -x PATH $PYENV_ROOT/shims $PATH
status --is-interactive; and . (pyenv init - | psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

