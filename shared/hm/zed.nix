{ config, pkgs, ... }: {
  programs.zed-editor = {

    enable = true;
    extensions = [
      "catppuccin"
      "nix"
      "toml"
      "zig"
      "java"
      "dockerfile"
      "rosé pine"
      "sql"
      "make"
      "ruby"
      "lua"
      "xml"
      "docker compose"
      "catppuccin icons"
      "csv"
      "ruff"
      "rainbow csv"
      "python lsp"
      "env"
      "templ"
      "meson"
      "golangci-lint"
      "discord presence"
      "svelte snippets"
      "svelte"
      "go sum highlighting"
      "go snippets"
      "python snippets"
      "air"

    ];
    userSettings = {
      features = { copilot = false; };
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      vim_mode = true;
      icon_theme = "Catppuccin Mocha";
      ui_font_size = 14;
      buffer_font_size = 14;
      theme = {
        mode = "dark";
        light = "Catppuccin Latte";
        dark = "Rosé Pine";
      };
      use_auto_surround = true;
      autosave = "on_focus_change";
      confim_quit = true;
      scrollbar = { show = "never"; };
      show_completion_documentation = true;
      tab_bar = { show = false; };
      format_on_save = "on";
      formatter = "language_server";
      inlay_hints = {
        enabled = false;
        show_parameter_hints = false;
      };
      diagnostics = { inline = { enabled = true; }; };
      file_finder = { modal_max_width = "large"; };
      remove_trailing_whitespace_on_save = true;
      show_edit_predictions = false;
      show_completion_on_input = true;
    };
    userKeymaps = [
      {
        context =
          "Editor && vim_mode == normal && vim_operator == none && !VimWaiting";
        bindings = {
          "space space" = "file_finder::Toggle";
          "space a" = "workspace::AddFolderToProject";
          "space l" = "workspace::ToggleLeftDock";
          "space f f" = "workspace::OpenFiles";
          "space f r" = "projects::OpenRecent";
          "space f m" = "file_finder::ToggleSplitMenu";
          "space f s" = "outline::Toggle";
          "space f d" = "diagnostics::Deploy";
          "space g" = "git_panel::ToggleFocus";
          "space b" = "tab_switcher::ToggleAll";
          "space f l" = "buffer_search::Deploy";
          "K" = "editor::Hover";
          "ctrl-h" = [ "workspace::ActivatePaneInDirection" "Left" ];
          "ctrl-l" = [ "workspace::ActivatePaneInDirection" "Right" ];
          "ctrl-k" = [ "workspace::ActivatePaneInDirection" "Up" ];
          "ctrl-j" = [ "workspace::ActivatePaneInDirection" "Down" ];
          "ctrl-shift-h" = [ "workspace::SwapPaneInDirection" "Left" ];
          "ctrl-shift-l" = [ "workspace::SwapPaneInDirection" "Right" ];
          "ctrl-shift-k" = [ "workspace::SwapPaneInDirection" "Up" ];
          "ctrl-shift-j" = [ "workspace::SwapPaneInDirection" "Down" ];
          "alt-j" = "vim::ResizePaneDown";
          "alt-k" = "vim::ResizePaneUp";
          "alt-h" = "vim::ResizePaneRight";
          "alt-l" = "vim::ResizePaneLeft";
          "/" = "workspace::NewSearch";
          "space v" = "pane::SplitRight";
          "space h" = "pane::SplitDown";
          "space e" = "project_panel::ToggleFocus";
          "space t" = "workspace::ToggleBottomDock";
          "space q" = "pane::CloseActiveItem";

          "space r" = "editor::Rename";
          "ctrl-f" = "editor::Format";
          "g j" = "editor::GoToDiagnostic";
          "g k" = "editor::GoToPreviousDiagnostic";
        };
      }
      {

        context = "Editor && vim_mode == visual && !VimWaiting && !menu";

        bindings = {

          "shift-k" = "editor::MoveLineUp";

          "shift-j" = "editor::MoveLineDown";

        };
      }
      # {
      #
      #   context = "Editor && !ProjectPanel";
      #
      #   bindings = {
      #
      #     "space e" = "workspace::ToggleLeftDock";
      #   };
      # }
      {

        context = "Terminal";

        bindings = {

          "space t" = "workspace::ToggleBottomDock";
        };
      }
      {

        context = "ProjectPanel";

        bindings = {

          "space e" = [ "workspace::SendKeystrokes" "cmd-b" ];
        };
      }
      {
        context = "vim_mode == insert";
        bindings = {
          tab = "editor::MoveRight";
          shift-tab = "editor::Tab";
        };
      }
      {
        context = "Git";
        bindings = {
          "shift-a" = "git::StageAll";
          "space w" = "git_panel::Close";
          "shift-c" = "git::GenerateCommitMessage";
          "space c" = "git_panel::FocusEditor";
        };
      }
    ];

  };

}
