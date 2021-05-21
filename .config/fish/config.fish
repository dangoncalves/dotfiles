if status is-interactive
    and not set -q TMUX
    tmux start-server
    test -z $DISPLAY; and set TMUX_SESSION_NAME default-nox; or set TMUX_SESSION_NAME default
    test (tmux ls 2> /dev/null | grep $TMUX_SESSION_NAME | wc -l) -eq 0
    and tmux new-session -s $TMUX_SESSION_NAME
    or tmux new-session -t $TMUX_SESSION_NAME
end

set -x VAGRANT_DEFAULT_PROVIDER libvirt
set -x LIBVIRT_DEFAULT_URI quemu:///system

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

function config
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
