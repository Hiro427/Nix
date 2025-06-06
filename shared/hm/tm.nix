{
    pkgs,
config,
    ...
}:

{
    programs.tmux = {
        enable = true;
        baseIndex = 1;
        prefix = "C-a";
        mouse = true;
        terminal = "screen-256color";
        plugins = with pkgs; [
            {
                plugin = tmuxPlugins.power-theme;
                extraConfig = ''
                    set -g @tmux_power_theme '#ebdbb2'
                    set -g @tmux_power_time_format '%-I:%M %p'
                '';
            }
        ];
        extraConfig = ''
            set-option -g terminal-overrides ',xterm-256color:RGB'
            set-option -g allow-passthrough on 

            set -g status-position top

            set -s escape-time 0
            unbind %
            bind "'" split-window -h

            bind-key "t" display-popup -E "$SHELL"

            unbind r
            bind r source-file ~/.config/tmux/tmux.conf

            bind -n C-h select-pane -L
            bind -n C-j select-pane -D
            bind -n C-k select-pane -U
            bind -n C-l select-pane -R

            bind -n M-h resize-pane -L 5
            bind -n M-j resize-pane -D 5
            bind -n M-k resize-pane -U 5
            bind -n M-l resize-pane -R 5

            bind -n C-t new-window
            bind -n C-w kill-window
            bind-key n next-window
            bind-key p previous-window

            bind-key "J" swap-pane -D
            bind-key "K" swap-pane -U

            bind -n C-s choose-window

            bind h split-window -h -c "#{pane_current_path}"
            bind v split-window -v -c "#{pane_current_path}"

            bind-key "s" run-shell "sesh connect \"$(
              sesh list --icons | fzf-tmux -p 80%,70% \
                --no-sort --ansi --border-label ' sesh ' --prompt '󱐋  ' \
                --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
                --bind 'tab:down,btab:up' \
                --bind 'ctrl-a:change-prompt(󱐋  )+reload(sesh list --icons)' \
                --bind 'ctrl-t:change-prompt(󱂬  )+reload(sesh list -t --icons)' \
                --bind 'ctrl-g:change-prompt(  )+reload(sesh list -c --icons)' \
                --bind 'ctrl-x:change-prompt(  )+reload(sesh list -z --icons)' \
                --bind 'ctrl-f:change-prompt(  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
                --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(󱐋  )+reload(sesh list --icons)' \
                --preview-window 'right:55%' \
                --preview 'sesh preview {}'
            )\""



        '';
    };
}
