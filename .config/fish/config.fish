if status is-interactive
    and not set -q TMUX
    tmux start-server
    test -z $DISPLAY; and set TMUX_SESSION_NAME (hostname)-nox; or set TMUX_SESSION_NAME (hostname)
    test (tmux ls 2> /dev/null | grep $TMUX_SESSION_NAME | wc -l) -eq 0
    and tmux new-session -s $TMUX_SESSION_NAME
    or tmux new-session -t $TMUX_SESSION_NAME
end

set -x VAGRANT_DEFAULT_PROVIDER libvirt
set -x LIBVIRT_DEFAULT_URI quemu:///system

source ~/.config/fish/aliases.fish

if test -f utils.fish
    source utils.fish
end
