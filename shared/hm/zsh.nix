{ config, pkgs, theme, ... }: {
  programs.zsh = {
    dotDir = "${config.xdg.configHome}/zsh";
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    # export LS_COLORS="$(vivid generate gruvbox-dark)" nord tokyonight-night
    initContent = ''
       res() { fg }
       _tsm() { sh ~/Nix/dots/scripts/tsm  zle accept-line }
       _yazi() { yazi zle accept-line }
       _update_repos() { gm -lg zle accept-line }

       zle -N res
       zle -N _tsm
       zle -N _yazi
       zle -N _update_repos
       
       # bindkey -M viins '^I' autosuggest-accept    
       bindkey '^N' fzf-file-widget
       bindkey '^X' _tsm
       bindkey '^Z' res
       bindkey '^F' _yazi
       bindkey '^G' _update_repos

       eval "$(starship init zsh)"
       export LS_COLORS="$(vivid generate ${theme.vividTheme})" 
      export PATH="$HOME/.cargo/bin:$PATH" 
        export PATH="$HOME/.go/bin:$PATH" 

       export PATH="$HOME"/.nimble/bin:$PATH

       colorscript -e suckless
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
      EDITOR = "hx";
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
      h = "hx .";
      ns = "nix-shell --run $SHELL";
      activate = "source .venv/bin/activate";
      s = "cd - >> /dev/null";
      v = "nvim";
      search = "is-fast";
      doom = "~/.config/emacs/bin/doom";
      gc = "git clone";
      tn =
        "tmux new-session -d -s $(basename $(pwd)); tmux attach -t $(basename $(pwd))";
      ta = "tmux a -t $(tmux ls | cut -d: -f1 | fzf --height 10 --reverse -1)";
      ts = "tmux ls";
      dev = "echo 'use nix' >> .envrc && direnv allow";
      nvidia-offload =
        "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia '$@'";
    };

    defaultKeymap = "viins";
  };
}
