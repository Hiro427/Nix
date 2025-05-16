{
    config, 
    pkgs, 
    catppuccin, 
    ...
}: 
{
    catppuccin = {
        flavor = "mocha"; 
        btop.enable = true;
        lazygit.enable = true;
        kitty.enable = true;
        ghostty.enable = true;
        cava.enable = true; 
        bat.enable = true;
        zathura.enable = true;
        zsh-syntax-highlighting.enable = true;
        spotify-player.enable = true;
        yazi = {
            enable = true; 
            accent = "lavender";
        };
        fzf = {
            enable = true;
            accent = "lavender";
        };
        freetube = {
            enable = true; 
            accent = "lavender"; 
            secondaryAccent = "blue";
        };

    };
    
}
