function cd
    builtin cd $argv
    if test -f utils.fish
        source utils.fish
    end
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
        config config --local status.showUntrackedFiles no
    else if test $argv[1] = 'tig'
        GIT_DIR=$gitdir GIT_WORK_TREE=$worktree tig
    else
        git --git-dir $gitdir --work-tree $worktree $argv
    end
end

function activate
    source /opt/venv/$argv[1]/bin/activate.fish
end

function cookiecutter
    /opt/venv/cookiecutter/bin/cookiecutter $argv
end

function ansible
    /opt/venv/ansible/bin/ansible $argv
end

function ansible-config
    /opt/venv/ansible/bin/ansible-config $argv
end

function ansible-connection
    /opt/venv/ansible/bin/ansible-connection $argv
end

function ansible-console
    /opt/venv/ansible/bin/ansible-console $argv
end

function ansible-doc
    /opt/venv/ansible/bin/ansible-doc $argv
end

function ansible-galaxy
    /opt/venv/ansible/bin/ansible-galaxy $argv
end

function ansible-inventory
    /opt/venv/ansible/bin/ansible-inventory $argv
end

function ansible-playbook
    /opt/venv/ansible/bin/ansible-playbook $argv
end

function ansible-pull
    /opt/venv/ansible/bin/ansible-pull $argv
end

function ansible-test
    /opt/venv/ansible/bin/ansible-test $argv
end

function ansible-vault
    /opt/venv/ansible/bin/ansible-vault $argv
end
