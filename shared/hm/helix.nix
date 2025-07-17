{ config, pkgs, theme, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    settings = {
      theme = theme.helixTheme;
      editor = {
        line-number = "relative";
        true-color = true;
        preview-completion-insert = true;
        completion-trigger-len = 1;
        auto-format = true;
        end-of-line-diagnostics = "hint";
      };
      editor.cursor-shape = { insert = "bar"; };
      editor.inline-diagnostics = { cursor-line = "warning"; };
      editor.indent-guides = {
        render = true;
        rainbow-option = "normal";
      };
      editor.lsp = {
        enable = true;
        display-messages = true;
      };
      editor.statusline = {
        left = [ "mode" "spacer" "version-control" ];
        center = [ ];
        right = [
          "file-base-name"
          "spinner"
          "spacer"
          "workspace-diagnostics"
          "spacer"
          "position"
          "file-modification-indicator"
        ];
        separator = "│";
      };
      keys.normal = {
        C-g = [ ":new" ":insert-output lazygit" ":buffer-close" ":redraw" ];
        C-f = [ ":new" ":insert-output yazi" ":buffer-close" ":redraw" ];
        C-r = [ ":open %sh run %val{filename}" ];
        space.y = ":clipboard-yank";
        space.space = ":open ~/coding/";
        a = [ "append_mode" "collapse_selection" ];
        "{" = [ "extend_to_line_bounds" "goto_prev_paragraph" ];
        "}" = [ "extend_to_line_bounds" "goto_next_paragraph" ];
        A-r = [ ":config-reload" ];
        A-j = [
          "ensure_selections_forward"
          "extend_to_line_bounds"
          "extend_char_right"
          "extend_char_left"
          "delete_selection"
          "add_newline_below"
          "move_line_down"
          "replace_with_yanked"
          "goto_line_start"
        ];
        A-k = [
          "ensure_selections_forward"
          "extend_to_line_bounds"
          "extend_char_right"
          "extend_char_left"
          "delete_selection"
          "move_line_up"
          "add_newline_above"
          "move_line_up"
          "replace_with_yanked"
          "goto_line_start"
        ];

      };
      keys.select = {
        u = [ "switch_to_lowercase" "collapse_selection" "normal_mode" ];
        U = [ "switch_to_uppercase" "collapse_selection" "normal_mode" ];
      };
    };
    languages = {
      language-server.emmet-language-server = {
        command = "/run/current-system/sw/bin/emmet-language-server";
        args = [ "--stdio" ];
      };
      # language-server.htmx-lsp =  {
      #     command = "/run/current-system/sw/bin/htmx-lsp";
      # };
      # language-server.templ =  {
      #     command = "/run/current-system/sw/bin/templ";
      #     args = ["lsp"];
      # };
      language = [
        {
          name = "rust";
          auto-format = true;
          roots = [ "Cargo.toml" "Cargo.lock" ];
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "python";
          language-servers = [ "ruff" "pylsp" ];
          auto-format = true;
        }
        {
          name = "html";
          language-servers = [
            "emmet-language-server"
            "vscode-html-language-server"
            "htmx-lsp"
          ];
          file-types = [ "html" "templ" "svelte" "vue" "jsx" "tsx" "php" ];
          auto-format = true;
        }
        {
          name = "nix";
          auto-format = true;
          file-types = [ "nix" ];

          formatter = { command = "${pkgs.nixfmt-classic}/bin/nixfmt"; };
        }
        # {
        #      name = "templ"; 
        #      language-servers = [ "emmet-language-server" "vscode-html-language-server" "htmx-lsp"]; 
        #      file-types = ["html" "templ"];
        #      auto-format = true; 
        #  } 

      ];
    };
  };

}
