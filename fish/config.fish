## Set values
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

if test -d /usr/local/texlive/2024/bin/x86_64-linux
    if not contains -- /usr/local/texlive/2024/bin/x86_64-linux $PATH
        set -p PATH /usr/local/texlive/2024/bin/x86_64-linux
    end
end

## Starship prompt
##if status --is-interactive
##   source ("/usr/bin/starship" init fish --print-full-init | psub)
##end


## Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.fish


## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

## Useful aliases
# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles
alias ip="ip -color"

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/garuda-update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Vi Keybindings
alias vikey="fish_vi_key_bindings"
alias dekey="fish_default_key_bindings"

set -g fish_cursor_default line
set -g fish_cursor_insert block 

## Run fastfetch if session is interactive
if status --is-interactive && type -q fastfetch
   fastfetch
end
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export MANROFFOPT="-c"

set -g tide_left_prompt_items private_mode os context pwd vi_mode git
set -g tide_right_prompt_items shlvl cmd_duration status time

set -g tide_private_mode_bg_color 1f2335
set -g tide_private_mode_color b4f9f8

set -g tide_os_color 4fd6be

set -g tide_pwd_bg_color 9d7cd8
set -g tide_pwd_color_truncated_dirs ffc777 

set -g tide_git_bg_color 262a41 
set -g tide_git_bg_color_unstable c53b53
set -g tide_git_bg_color_urgent ff007c
set -g tide_git_icon 
set -g tide_git_color_branch f3eef6 
set -g tide_git_color_conflicted ff757f
set -g tide_git_color_dirty ff757f 
set -g tide_git_color_operation 7dcfff
set -g tide_git_color_staged 41a6b5
set -g tide_git_color_stash 7dcfff
set -g tide_git_color_untracked 41a6b5
set -g tide_git_color_upstream 41a6b5

set -g tide_shlvl_bg_color 3d59a1
set -g tide_shlvl_color ffffff

set -g tide_cmd_duration_bg_color 77dd77
set -g tide_cmd_duration_decimals 4

set -g tide_status_bg_color ff007c
set -g tide_status_color 00ff83
set -g tide_status_bg_color_failure 4f1e45
set -g tide_status_color_failure d74459

set -g tide_time_bg_color 8b00ff
set -g tide_time_color ffffff
