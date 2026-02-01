{ pkgs, ... }:
with pkgs; [
  #languages
  typescript
  zig
  go
  gcc
  clang
  clang-tools
  gnumake
  glibc
  cargo
  python312
  python312Packages.nuitka
  basedpyright
  python313Packages.python-lsp-server
  python313Packages.black
  pyright
  nodejs_22
  lua
  love
  stylua
  luabind
  luajit
  # rustup # component add rust-analyzer rustup default stable(?)
  cargo
  rust-analyzer
  rustfmt
  rustc
  clippy
  #lsps and formatters
  taplo
  zls
  yaml-language-server
  typescript-language-server
  marksman
  zulu # java
  ruff
  jdt-language-server
  nil
  nixd
  mesonlsp
  lua-language-server
  gopls
  golangci-lint-langserver
  golangci-lint
  llvmPackages_19.clang-tools
  cmake-language-server
  cmake-format
  cmake
  pkg-config
  gnumake
  sqls
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
  sqlite
  uv
  tmux
  #x11 dev stuff 
  xorg.libX11
  docker
  docker-compose
  docker-compose-language-service
  postgresql
  kubernetes
  svelte-language-server
  terraform
  terraformer
  terraform-ls
  nginx
  flyctl
  templ
  #fortran
  fortls
  gfortran
  fprettify
  #haskell stuff
  ghc
  ormolu
  haskell-language-server
  air
  wgo
  go-blueprint
  bun
  fswatch
  simple-completion-language-server
  #php and laravel 
  php
  intelephense
  laravel
  blade-formatter
  # php84Packages.composer
  # php84Extensions.gd
  # php84Extensions.zip
  # php84Extensions.readline
  # php84Extensions.curl
  # php84Extensions.xml
  # php84Extensions.mbstring
  prometheus-php-fpm-exporter
  symfony-cli
  ncurses
  nixfmt
  prettierd
  nim
  nimble
  nimlangserver
  deno
  sql-formatter
  devenv
  odin
  ols
  yq
  asm-lsp
  nasm
  kotlin-language-server
  kotlin
  kotlin-interactive-shell
  tinymist
  typstyle
  typst-live
  typst
  hugo
  ruff
  lld
  elixir-ls
  elixir
  uwu-colors # lsp to get hex colors etc in documents (for helix)
  vue
  vue-language-server
]
