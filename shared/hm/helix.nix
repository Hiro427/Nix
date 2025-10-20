{ config, pkgs, theme, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    themes = {
      transparent = {
        inherits = theme.helixTheme;
        "rui.background" = { };
        "ui.menu" = { };
        "ui.help" = { };
        "ui.popup" = { };
        "ui.statusline" = { };
        "ui.statusline.inactive" = { };

      };
    };

    settings = {
      theme = "transparent";
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
      editor.lsp = {
        enable = true;
        display-messages = true;
        # display-inlay-hints = true;
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
        C-f = [ ":new" ":insert-output yazi" ":buffer-close" ":redraw" ];
        C-r = [ ":earlier" ];
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
        space.f.l = [ "select_all" "select_regex" ];
        space.j = ":buffer-next";
        space.k = ":buffer-previous";
        space.x = ":write-buffer-close";
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
        space.y.t = [
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
      };
    };
    languages = {
      language-server.emmet-language-server = {
        command = "/run/current-system/sw/bin/emmet-language-server";
        args = [ "--stdio" ];
      };
      language-server.golangci-lint-langserver = {
        command = "/run/current-system/sw/bin/golangci-lint-langserver";
        args = [
          "golangci-lint"
          "run"
          "--output.json.path"
          "stdout"
          "--show-stats=false"
          "--issues-exit-code=1"
        ];
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
          name = "css";
          language-servers = [ "vscode-css-language-server" "tailwindcss-ls" ];
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
        {
          name = "go";
          # auto-format = true;
          formatter = { command = "/run/current-system/sw/bin/gofmt}"; };
          language-servers = [ "gopls" "golangci-lint-langserver" ];
        }
        # {
        #      name = "templ"; 
        #      language-servers = [ "emmet-language-server" "templ" "htmx-lsp" "tailwindcss-ls"]; 
        #      file-types = ["html" "templ"];
        #      auto-format = true; 
        #  } 

      ];
    };
  };

}
