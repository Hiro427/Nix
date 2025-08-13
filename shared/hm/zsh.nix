{ config, pkgs, theme, ... }: {
  programs.zsh = {
    dotDir = ".config/zsh";
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    # export LS_COLORS="$(vivid generate gruvbox-dark)" nord tokyonight-night
    initContent = ''
      bindkey -M viins '^I' autosuggest-accept    

      eval "$(starship init zsh)"
      export LS_COLORS="$(vivid generate ${theme.vividTheme})" 



    '';
    history = {
      append = true;
      share = true;
      save = 1000;
      size = 999;
      expireDuplicatesFirst = true;
      extended = true;
    };
    sessionVariables = {
      EDITOR = "nvim";
      REPO_FPATH = "$HOME/.dotfiles/github/repos.txt";
      PROJ_DIR = "$HOME/coding/projects/";
      MANGA_DL_DIR = "$HOME/Downloads/Manga/";
      MANGA_TUI_DATA_DIR = "$HOME/Downloads/mangatui";
      GHW_SUPPRESS_WARNINGS = 1;
    };
    shellAliases = {
      ls = "eza --color=always --git --icons=auto --no-user";
      l =
        "eza --color=always --git --icons=auto --no-user --no-permissions --no-time --long --no-filesize";
      c = "cd ..";
      e = "exit";
      ns = "";
      activate = "source .venv/bin/activate";
      s = "cd - >> /dev/null";
      vim = "nvim";
      # alias rofi="rofi -show drun -normal-window"
      search = "is-fast";
      doom = "~/.config/emacs/bin/doom";
      tn = "tmux new-session -s $(basename $(pwd))";
      ta = "tmux a -t $(tmux ls | cut -d: -f1 | fzf --height 10 --reverse)";
      ts = "tmux ls";

      nvidia-offload =
        "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia '$@'";
    };

    defaultKeymap = "viins";
  };
}
