if status is-interactive
    if [ "$INSIDE_EMACS" = "vterm" ]
        source ~/.emacs.d/elpa/vterm-20210908.640/etc/emacs-vterm.fish
    else if not set -q INSIDE_VSCODE; and not set -q TMUX
        tmux start-server
        test -z $DISPLAY; and set TMUX_SESSION_NAME (hostname)-nox; or set TMUX_SESSION_NAME (hostname)
        test (tmux ls 2> /dev/null | grep $TMUX_SESSION_NAME | wc -l) -eq 0
        and tmux new-session -s $TMUX_SESSION_NAME
        or tmux new-session -t $TMUX_SESSION_NAME
    end

    set -x EDITOR emacs-nox
    set -x VISUAL emacs

    set -x VAGRANT_DEFAULT_PROVIDER libvirt
    set -x LIBVIRT_DEFAULT_URI qemu:///system

    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent

    source ~/.config/fish/aliases.fish

    if test -f .hacking/custom.fish
        source .hacking/custom.fish
    end

    starship init fish | source
end
