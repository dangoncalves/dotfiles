function cd
    builtin cd $argv
    if test -f .hacking/custom.fish
        source .hacking/custom.fish
    end
end

function cat
    bat $argv
end

function ls
    exa $argv
end

function purge_tmp_file
    if test (count $argv) -eq 0
        set directory .
    else
        set directory $argv[1]
    end
    find $directory -name '*~' -delete
end

function ssh
    set SSH_BIN (which ssh)
    TERM=xterm-256color $SSH_BIN $argv
end

function vagrant
    set VAGRANT_BIN (which vagrant)
    TERM=xterm-256color $VAGRANT_BIN $argv
end

function sudo
    set SUDO_BIN (which sudo)
    TERM=xterm-256color $SUDO_BIN $argv
end

function dotfiles
    set repo git@gitlab.com:dangoncalves/dotfiles
    set gitdir ~/.local/share/dotfiles
    set worktree ~
    if test $argv[1] = 'init'
        git clone --bare $repo $gitdir
        dotfiles config --local status.showUntrackedFiles no
    else if test $argv[1] = 'tig'
        GIT_DIR=$gitdir GIT_WORK_TREE=$worktree tig
    else
        git --git-dir $gitdir --work-tree $worktree $argv
    end
end

function vterm_printf;
    if begin; [  -n "$TMUX" ]  ; and  string match -q -r "screen|tmux" "$TERM"; end 
        # tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

if [ "$INSIDE_EMACS" = 'vterm' ]
    function clear
        vterm_printf "51;Evterm-clear-scrollback";
        tput clear;
    end
end

function activate
    source ~/.local/share/venv/$argv[1]/bin/activate.fish
end

function cookiecutter
    ~/.local/share/venv/cookiecutter/bin/cookiecutter $argv
end

function ansible
    ~/.local/share/venv/ansible/bin/ansible $argv
end

function ansible-config
    ~/.local/share/venv/ansible/bin/ansible-config $argv
end

function ansible-connection
    ~/.local/share/venv/ansible/bin/ansible-connection $argv
end

function ansible-console
    ~/.local/share/venv/ansible/bin/ansible-console $argv
end

function ansible-doc
    ~/.local/share/venv/ansible/bin/ansible-doc $argv
end

function ansible-galaxy
    ~/.local/share/venv/ansible/bin/ansible-galaxy $argv
end

function ansible-inventory
    ~/.local/share/venv/ansible/bin/ansible-inventory $argv
end

function ansible-playbook
    ~/.local/share/venv/ansible/bin/ansible-playbook $argv
end

function ansible-pull
    ~/.local/share/venv/ansible/bin/ansible-pull $argv
end

function ansible-test
    ~/.local/share/venv/ansible/bin/ansible-test $argv
end

function ansible-vault
    ~/.local/share/venv/ansible/bin/ansible-vault $argv
end

function my-gandi
    ~/.local/share/venv/my_gandi/bin/my-gandi $argv
end
