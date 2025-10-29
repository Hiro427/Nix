{ config, pkgs, ... }: {
  services.dunst = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
      size = "128x128";
    };
    settings = {
      global = {
        monitor = 0;
        timeout = 5;
        follow = "none";
        width = 300;
        height = 500;
        origin = "top-right";
        scale = 0;
        # frame_color = "#89b4fa"; 
        # separator_color = "frame";
        # background = "#1e1e2e";
        # foreground = "#b4befe"; 
        notification-limit = 10;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 100;
        progress_bar_max_width = 150;
        progress_bar_corner_radius = 20;
        progress_bar_corners = "all";
        icon_corner_radius = 0;
        icons_corners = "all";
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 2;
        gap_size = 10;
        min_icon_size = 40;
        max_icon_size = 128;
        sort = "yes";
        # font = "JetBrainsMono Nerd Font 12"; #using stylix
        format = ''
          <b>%s</b>
          %b'';
        alignment = "center";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = true;
        stack_duplicates = true;
        hide_duplicate_count = false;
        enable_recursive_icon_lookup = true;
        sticky_history = "yes";
        history_length = 20;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 10;
        corners = "all";
        force_xwayland = false;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
        per_monitor_dpi = false;
      };
    };
  };
}
