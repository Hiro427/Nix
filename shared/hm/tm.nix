{
    config, 
    pkgs, 
    ...
}: 

{
    programs.tmux = {
        enable = true; 
        baseIndex = 1; 
        prefix = "C-x"; 
        mouse = true;
        terminal = "screen-256color";
        plugins = with pkgs; [
            {
                plugin = tmuxPlugins.catppuccin; 
                extraConfig = ''
                    set -g @catppuccin_flavor "mocha"
                    set -g @catppuccin_window_status_style "rounded"
                    set -g status-right-length 100
                    set -g status-left-length 100
                    set -g status-left ""
                    set -g @catppuccin_window_default_text " #W"
                    set -g @catppuccin_window_text " #W"
                    set -g @catppuccin_window_current_text " #W"
                    set -g status-right "#{E:@catppuccin_status_application}"
                    set -ag status-right "#{E:@catppuccin_status_session}"
                    set -ag status-right "#{E:@catppuccin_status_uptime}"
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
            bind -n C-n next-window 
            bind -n C-p previous-window
            
            bind -n M-a swap-pane -D
            bind -n M-f swap-pane -U


            
            bind -n M-s choose-window

            bind h split-window -h
            bind v split-window -v



        '';
    };
}
