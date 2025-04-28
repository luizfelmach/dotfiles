alias ..="cd ../"
alias ...="cd ../../"
alias :q="exit"
alias pacu="paru -Syu"
alias paci="paru -S"
alias pacr="paru -Rnsu"
alias ports="sudo netstat -tulanp"
alias venvn="python -m venv $HOME/.globalenv"
alias venva="source $HOME/.globalenv/bin/activate"
alias venvr="rm -r $HOME/.globalenv/bin/activate"
alias cz='chezmoi'
alias dk='docker'

set -U fish_user_paths ~/.cargo/bin $fish_user_paths
set -U fish_user_paths ~/.bin $fish_user_paths
set -U fish_user_paths ~/.local/share/pnpm $fish_user_paths

bind \cg lazygit
bind \ce yazi

if type -q eza
    alias ls="eza -lh --group-directories-first --icons=always $args"
    alias lt="eza --tree --level=2 --long --icons=always --git $args"
end

if type -q paru
    alias pacman=paru
else
    git clone "https://aur.archlinux.org/paru-bin.git" /tmp/paru
    cd /tmp/paru
    makepkg -si
    cd -
    rm -rf /tmp/paru
    alias pacman=paru
end

if type -q bat
    alias cat=bat
end

if type -q zoxide
    eval "$(zoxide init --cmd cd fish)"
end

if type -q fzf
    eval "$(fzf --fish)"
end

function compress
    tar -czvf $argv[1] $argv[2..]
end

function extract
    tar -xzvf $argv[1]
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
