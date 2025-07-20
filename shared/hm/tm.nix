{ pkgs, config, theme, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-a";
    mouse = true;
    plugins = with pkgs;
      [
        # colors= gruv:ebdbb2, ctp: b4befe
        # {
        #     plugin = tmuxPlugins.power-theme;
        #     extraConfig = ''
        #         set -g @tmux_power_theme '${theme.tmuxStatusLine}'
        #         set -g @tmux_power_time_format '%-I:%M %p'
        #     '';
        # }
        {
          plugin = tmuxPlugins.vim-tmux-navigator;
          extraConfig = ''
            set -g @vim_navigator_mapping_left "C-Left C-h"  # use C-h and C-Left
            set -g @vim_navigator_mapping_right "C-Right C-l"
            set -g @vim_navigator_mapping_up "C-k"
            set -g @vim_navigator_mapping_down "C-j"
            set -g @vim_navigator_mapping_prev ""  # removes the C-\ binding
          '';
        }
      ];
    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set-option -g allow-passthrough on 

      set -ga terminal-overrides ",xterm-256color:Tc"
      set -g status-position bottom

      set -s escape-time 0
      unbind %
      bind "'" split-window -h

      bind-key "t" display-popup -E "$SHELL"

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf


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

      bind-key "x" run-shell "sesh connect \"$(
        sesh list --icons | fzf-tmux -p 60%,40% \
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

      set -g @tmux-dotbar-fg "${theme.tmuxBarColors.dotbar-fg}"
      set -g @tmux-dotbar-bg "${theme.tmuxBarColors.dotbar-bg}"
      set -g @tmux-dotbar-fg-current "${theme.tmuxBarColors.dotbar-fg-current}"
      set -g @tmux-dotbar-fg-session "${theme.tmuxBarColors.dotbar-fg-session}"
      set -g @tmux-dotbar-fg-prefix "${theme.tmuxBarColors.dotbar-fg-prefix}"            

      run-shell ~/Nix/dots/tmux/plugins/dotbar.tmux



    '';
  };
}
