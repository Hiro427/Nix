{pkgs, ...}:with pkgs; 
[
    #languages
    typescript
    zig
    go
    gcc
    cargo 
    php
    intelephense
    python312Full
    nodejs_22
    lua
    lua52Packages.luafilesystem
    luajit
    luabind
    rustup # component add rust-analyzer rustup default stable(?)
    #lsps and formatters
    taplo
    zls
    yaml-language-server
    typescript-language-server
    marksman
    zulu #java
    ruff
    jdt-language-server
    python312Packages.python-lsp-server
    nil
    nixd
    stylua
    mesonlsp
    lua-language-server
    gopls
    golangci-lint-langserver
    golangci-lint
    llvmPackages_19.clang-tools
    cmake-language-server
    glow
    cmake
    gnumake
    sqls
    docker-language-server
    shfmt
    nixpkgs-fmt
    taplo
    spectral-language-server
    bash-language-server
    vscode-langservers-extracted
    htmx-lsp
    emmet-language-server
    sass
    tailwindcss
    tailwindcss-language-server
    #misc 
    live-server 
    sqlite 
    uv
    sesh
    tmux
    #x11 dev stuff 
    xorg.libX11
    docker 
    docker-compose
    docker-compose-language-service
    postgresql
    kubernetes
]
