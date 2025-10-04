{ config, pkgs, inputs, ... }:
with pkgs; [
  inputs.zen-browser.packages."${system}".beta
  inputs.lobster.packages.${system}.lobster
  xclip
  cudaPackages.cuda_nvcc
  vivid
  roboto
  source-sans-pro
  font-awesome_6
  chess-tui
  solitaire-tui
  stockfish
]
