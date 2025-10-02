{ config, pkgs, inputs, ... }:
with pkgs; [
  inputs.zen-browser.packages."${system}".beta
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
