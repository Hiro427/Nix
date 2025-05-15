{config, pkgs, inputs, ...}: with pkgs; 
[
    inputs.zen-browser.packages."${system}".default 
    xclip 
    cudaPackages.cuda_nvcc
]
