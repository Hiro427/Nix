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
        mangohud = {
            enable = true;
            settings = {
                fps = true;
                gpu_list = 0;
                  gpu_temp = true;
                  gpu_core_clock = true;
                  cpu_stats = false;
                  ram = false;
                  io_read = false;
                  io_write = false;
                  vram = true;
                  position = "bottom-left";
                frametime = false;
                frame_timing = 0;
                horizontal_stretch = false;
                horizontal = true;
                  toggle_hud = "F12";
            };
        };
        bemenu = {
            enable = true;
            settings = {
                ignorecase = true; 
                prompt = "NixOS  ";
                list = 5;
            };
        };
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
