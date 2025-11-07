{ config, pkgs, theme, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    themes = {
      transparent = {
        inherits = theme.helixTheme;
        "ui.background" = { };
        "ui.menu" = { };
        "ui.help" = { };
        "ui.popup" = { };
        "ui.statusline" = { };
        "ui.statusline.inactive" = { };

      };
    };

    settings = {
      theme = "transparent";
      # theme = theme.helixTheme;
      editor = {
        line-number = "relative";
        true-color = true;
        preview-completion-insert = true;
        completion-trigger-len = 1;
        auto-format = true;
        end-of-line-diagnostics = "hint";
      };
      editor.cursor-shape = { insert = "bar"; };
      editor.inline-diagnostics = { cursor-line = "error"; };
      editor.indent-guides = {
        render = true;
        # rainbow-option = "dim";
      };
      editor.file-picker = { hidden = false; };
      editor.lsp = {
        snippets = true;
        enable = true;
        display-messages = true;
        display-inlay-hints = false;
      };
      editor.statusline = {
        left = [ "version-control" "spinner" ];
        center = [ "workspace-diagnostics" ];
        right = [
          "file-base-name"
          "file-modification-indicator"
          "read-only-indicator"
        ];
        separator = "│";
      };
      keys.normal = {
        C-g = [ ":new" ":insert-output lazygit" ":buffer-close" ":redraw" ];
        C-r = [ ":earlier" ];
        space.q = [ ":lsp-stop" ":write-quit-all" ];
        space.r = "repeat_last_motion";

        space.d = "hover";

        space.y.y = ":clipboard-yank";
        space.f.j = "jumplist_picker";
        space.f.f = ":open .";
        space.f.p = ":open ~/coding/";
        space.f.d = "diagnostics_picker";
        space.f.D = "workspace_diagnostics_picker";
        space.f.s = "symbol_picker";
        space.f.g = "global_search";
        space.f.S = "workspace_symbol_picker";
        space.f.b = "buffer_picker";
        space.f.t = "@<space>/(TODO|FIXME|BUG|NOTE)";
        space.f.l = [ "select_all" "select_regex" ];
        space.j = ":buffer-next";
        space.k = ":buffer-previous";
        space.w.b = ":write-buffer-close";
        space.h.s = ":hsplit";

        space.v.s = ":vsplit";
        space.l.i = ":toggle lsp.display-inlay-hints";
        space.l.r = "rename_symbol";
        space.h.a =
          ":sh ~/Nix/dots/scripts/marks.sh --add-file '%sh{pwd}/%sh{basename %{buffer_name}}' ";
        space.h.o = ":open /tmp/hxmarks";
        space.h.h = ":sh ~/Nix/dots/scripts/marks.sh ls";
        space.h.z = ":open %sh{~/Nix/dots/scripts/marks.sh --file 1}";
        space.h.x = ":open %sh{~/Nix/dots/scripts/marks.sh --file 2}";
        space.h.c = ":open %sh{~/Nix/dots/scripts/marks.sh --file 3}";
        space.h.v = ":open %sh{~/Nix/dots/scripts/marks.sh --file 4}";
        space.h.b = ":open %sh{~/Nix/dots/scripts/marks.sh --file 5}";
        C-f = [
          ":sh rm -f /tmp/unique-file"
          ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
          ":insert-output echo 'x1b[?1049hx1b[?2004h' > /dev/tty"
          ":open %sh{cat /tmp/unique-file}"
          ":redraw"
        ];
        ret = "goto_word";
        space.space = ":open .";
        g.c = "toggle_comments";
        "{" = [ "extend_to_line_bounds" "goto_prev_paragraph" ];
        "}" = [ "extend_to_line_bounds" "goto_next_paragraph" ];
        A-r = [ ":config-reload" ];

      };
      keys.select = {
        u = [ "switch_to_lowercase" "collapse_selection" "normal_mode" ];
        U = [ "switch_to_uppercase" "collapse_selection" "normal_mode" ];
        space.s.a = "surround_add";
        space.s.r = "surround_replace";
        space.s.d = "surround_delete";
        space.g.c = "toggle_comments";
        K = [
          "goto_line_end"
          "extend_line_below"
          "delete_selection"
          "move_line_up"
          "paste_before"
          "select_mode"
        ];
        J = [
          "goto_line_end"
          "extend_line_below"
          "delete_selection"
          "paste_after"
          "select_mode"
        ];
        # K = [ # scroll selections up one lin
        #   "ensure_selections_forward"
        #   "extend_to_line_bounds"
        #   "extend_char_right"
        #   "extend_char_left"
        #   "delete_selection"
        #   "move_line_up"
        #   "add_newline_above"
        #   "move_line_up"
        #   "replace_with_yanked"
        # ];

        # J = [ # scroll selections down one line
        #   "ensure_selections_forward"
        #   "extend_to_line_bounds"
        #   "extend_char_right"
        #   "extend_char_left"
        #   "delete_selection"
        #   "add_newline_below"
        #   "move_line_down"
        #   "replace_with_yanked"
        # ];
      };
    };
    languages = {
      language-server.emmet-language-server = {
        command = "${pkgs.emmet-language-server}/bin/emmet-language-server";
        args = [ "--stdio" ];
      };
      language-server.golangci-lint-langserver = {
        command =
          "${pkgs.golangci-lint-langserver}/bin/golangci-lint-langserver";
        args = [
          "golangci-lint"
          "run"
          "--output.json.path"
          "stdout"
          "--show-stats=false"
          "--issues-exit-code=1"
        ];
      };
      language-server.htmx-lsp = { command = "${pkgs.htmx-lsp}/bin/htmx-lsp"; };
      language-server.templ = {
        command = "${pkgs.templ}/bin/templ";
        args = [ "lsp" ];
      };
      language-server.uwu_colors = {
        command = "${pkgs.uwu-colors}/bin/uwu_colors";
      };
      language-server.tailwindcss-ls = {
        command =
          "${pkgs.tailwindcss-language-server}/bin/tailwindcss-language-server";
        args = [ "--stdio" ];
        config = { userLanguages = { templ = "html"; }; };
      };
      language = [
        {
          name = "rust";
          auto-format = true;
          roots = [ "Cargo.toml" "Cargo.lock" ];
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "css";
          language-servers =
            [ "vscode-css-language-server" "tailwindcss-ls" "uwu_colors" ];
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
          language-servers = [ "nixd" "uwu_colors" ];
          file-types = [ "nix" ];

          formatter = { command = "${pkgs.nixfmt-classic}/bin/nixfmt"; };
        }
        {
          name = "go";
          # auto-format = true;
          formatter = { command = "${pkgs.go}/bin/gofmt}"; };
          language-servers =
            [ "gopls" "golangci-lint-langserver" "uwu_colors" ];
        }
        {
          name = "templ";
          language-servers = [
            "emmet-language-server"
            "templ"
            "htmx-lsp"
            "tailwindcss-ls"
            "uwu_colors"
          ];
          file-types = [ "html" "templ" ];
          auto-format = true;
        }

      ];
    };
  };

}
