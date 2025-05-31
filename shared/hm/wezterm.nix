{
    config, 
    pkgs, 
    ...
}: 
{
    programs.wezterm = {
        enable = true; 
        extraConfig = ''
            local wezterm = require("wezterm")
            local config = wezterm.config_builder()
            config.term = "xterm-256color"

            config.initial_rows = 30
            config.initial_cols = 100
            config.enable_tab_bar = false
            config.enable_kitty_graphics = true
            config.window_close_confirmation = "NeverPrompt"
            config.enable_wayland = false
            if os.getenv("XDG_CURRENT_DESKTOP") == "i3" then
            config.window_decorations = "RESIZE"
            else
                config.window_decorations = "NONE"
            end
            config.cursor_blink_ease_in = "Constant"
            config.cursor_blink_ease_out = "Constant"
            config.default_cursor_style = "BlinkingBar"
            config.window_background_opacity = 1
            -- config.font_size = 13
            -- config.font = wezterm.font("JetBrainsMono Nerd Font")
            -- config.color_scheme = "Gruvbox Dark (Gogh)"
            config.pane_select_font_size = 24

            return config
        '';
    };
}
