{config, pkgs, inputs, ...}: with pkgs; 
[
    inputs.zen-browser.packages."${system}".beta
    xclip 
    cudaPackages.cuda_nvcc
    vivid
]
