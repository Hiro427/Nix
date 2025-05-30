{
    config, 
    pkgs, 
    ...
}: 
{
    programs = {
        btop.enable = true;
        lazygit.enable = true; 
        cava.enable = true;
        bat.enable = true;
        bemenu.enable = true; 
        rofi.enable = true;
        foliate.enable = true; 
        zathura.enable = true;
        zoxide = {
            enable = true; 
            enableZshIntegration = true; 
            options = [
                "--cmd 'cd'"
            ];
        };
        fzf = {
            enable = true; 
            enableZshIntegration = true;
        };
        joplin-desktop = {
            enable = true; 
            sync.target = "dropbox"; 
            sync.interval = "10m";
        };

    };
}
