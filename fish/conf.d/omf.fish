# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# theme selection
set -g theme_color_scheme gruvbox

# personal custom aliases
alias hp3="cd ~/Desktop/HP3"
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

# fish vim mode
fish_vi_key_bindings
fish_vi_cursor

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
