{
    config, 
    pkgs,
    ...
}: 
{
  programs.zed-editor = {

        enable = true;
        extensions = [
        "catppuccin"
        "nix"
        "toml"
        "zig"
        "java"
        "dockerfile"
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
            features = {
                copilot = false;
            };
            telemetry = {
                metrics = false;
                diagnostics = false;
            };
            vim_mode = true;
            icon_theme = "Catppuccin Mocha";
            # ui_font_size = 16;
            # buffer_font_size = 16;
            # theme = {
            #     mode = "dark";
            #     light = "Catppuccin Latte";
            #     dark = "Catppuccin Mocha";
            # };
            use_auto_surround = true;
            autosave = "on_focus_change";
            confim_quit = true;
            scrollbar = {
                show = "never";
            };
            show_completion_documentation = true;
            tab_bar = {
                show = true;
            };
            format_on_save = "on";
            formatter = "language_server";
            inlay_hints = {
                enabled = false;
                show_parameter_hints = false;
            };
            diagnostics = {
                inline = {
                    enabled = true;
                };
            };
            file_finder = {
                modal_max_width = "large";
            };
            remove_trailing_whitespace_on_save = true;
            show_edit_predictions = false;
            show_completion_on_input = true;
        };
        userKeymaps = [
            {
                context = "Editor && vim_mode == normal && vim_operator == none && !VimWaiting";
                bindings = {
                    "space space" = "file_finder::Toggle";
                    "space t" = [
                        "workspace::OpenTerminal"
                        {
                            working_directory = ".";
                        }
                    ];
                    "space a" = "workspace::AddFolderToProject";
                    "space e" = "workspace::ToggleLeftDock";
                    "space o" = "workspace::OpenFiles";
                    "/" = "workspace::NewSearch";
                    ctrl-shift-k = "pane::SplitLeft";
                    ctrl-shift-j = "pane::SplitDown";
                    "space l" = "pane::TogglePreviewTab";
                    ctrl-e = "project_panel::ToggleFocus";
                    "space w" = "terminal_panel::ToggleFocus";
                };
            }
            {
                context = "vim_mode == insert";
                bindings = {
                     tab = "editor::MoveRight";
                     shift-tab = "editor::Tab";
                };
            }
        ];

    };


}
