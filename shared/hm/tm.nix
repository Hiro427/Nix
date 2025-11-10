{ pkgs, config, theme, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-a";
    mouse = true;
    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set-option -g allow-passthrough on

      set -ga terminal-overrides ",xterm-256color:Tc"
      set -g status-position bottom

      set -s escape-time 0
      unbind %
      bind "'" split-window -h

      bind-key "t" display-popup -E "$SHELL"
      bind-key "x" 
      bind-key "c" display-popup -E "~/Nix/dots/scripts/wm/shared/cheatsheet.sh"


      unbind r
      bind r source-file ~/.config/tmux/tmux.conf 

      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-h select-pane -L
      bind -n C-l select-pane -R

      bind -n M-h resize-pane -L 5
      bind -n M-j resize-pane -D 5
      bind -n M-k resize-pane -U 5
      bind -n M-l resize-pane -R 5

      bind -n C-t new-window
      bind-key "m" run-shell tsm
      unbind C-w
      bind-key w kill-window
      bind-key n next-window
      bind-key p previous-window

      bind-key "J" swap-pane -D
      bind-key "K" swap-pane -U
      bind-key j switch-client -n  
      bind-key k switch-client -p  # previous session

      bind v split-window -h -c "#{pane_current_path}"
      bind h split-window -v -c "#{pane_current_path}"

      bind -n C-s choose-tree -Zs
      bind-key -T choose-tree n command-prompt -p "new-session name:" "new-session -ds '%%'"

      set -g @tmux-dotbar-fg "${theme.tmuxBarColors.dotbar-fg}"
      set -g @tmux-dotbar-bg "${theme.tmuxBarColors.dotbar-bg}"
      set -g @tmux-dotbar-fg-current "${theme.tmuxBarColors.dotbar-fg-current}"
      set -g @tmux-dotbar-fg-session "${theme.tmuxBarColors.dotbar-fg-session}"
      set -g @tmux-dotbar-fg-prefix "${theme.tmuxBarColors.dotbar-fg-prefix}"            

      run-shell ~/Nix/dots/tmux/plugins/dotbar.tmux



    '';
  };
}
