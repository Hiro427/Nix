{}
# {
#     config, 
#     pkgs, 
#     ...
# }: 
# {
#  programs.helix = {
#       enable = true;
#       package  = pkgs.evil-helix;
#       settings = {
#         theme = "catppuccin_mocha";
#         editor = {
#           line-number = "relative";
#           true-color = true;
#           preview-completion-insert = true;
#           completion-trigger-len = 1;
#           auto-format = true;
#           end-of-line-diagnostics = "hint";
#         };
#         editor.cursor-shape = {
#           insert = "bar";
#         };
#         editor.inline-diagnostics = {
#           cursor-line = "warning";
#         };
#         editor.indent-guides = {
#           render = true;
#           rainbow-option = "normal";  
#         };
#         editor.lsp = {
#           enable = true;
#           display-messages = true;
#         };
#         editor.statusline = {
#          left = ["mode" "spacer" "version-control"];
#          center = [];
#          right = ["file-base-name" "spinner" "spacer" "workspace-diagnostics" "spacer" "position" "file-modification-indicator"];
#          separator = "│";
#         };
#         keys.normal = {
#           C-g = [":new" ":insert-output lazygit" ":buffer-close" ":redraw"];
#           C-f = [":new" ":insert-output yazi" ":buffer-close" ":redraw"];
#           C-r = [":open %sh run %val{filename}"];
#           space.y = ":clipboard-yank";
#           space.space = ":open ~/coding/";
#           a = ["append_mode" "collapse_selection"];
#         "{" = ["extend_to_line_bounds" "goto_prev_paragraph"];
#         "}" = ["extend_to_line_bounds" "goto_next_paragraph"];
#         };
#         keys.select = {
#          u = ["switch_to_lowercase" "collapse_selection" "normal_mode"];
#          U = ["switch_to_uppercase" "collapse_selection" "normal_mode"];
#          p = [":clipboard-paste-after"];
#          P = [":clipboard-paste-before"];
#         };
#       };
#     };
#
# }
