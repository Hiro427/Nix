{
    config, 
    pkgs, 
    ...
}: 
{
    services.picom = {
        enable = true; 
        fadeDelta = 4;
        fade = true; 
        fadeSteps = [
            0.028
            0.03
        ];
        inactiveOpacity = 0.9; 
        activeOpacity = 1; 
        backend = "glx"; 
        vSync = true; 

        settings = {
            corner-radius = 8; 
            blur = {
                method = "dual_kawase"; 
            };
            glx-use-copybuffer-mess = true; 
            glx-copy-from-front = true; 
            glx-swap-method = 2; 
            xrender-sync = true; 
            xrender-sync-fence = true;
            rounded-corners-exclude = [
                "class_g = 'i3bar'"
                "class_g = 'dmenu'"
            ];
        };
        opacityRules = [
            "100:class_g = 'Rofi'"
            "100:class_g = 'Dunst'"
            "100:class_g = 'dmenu'"
        ];

    }; 
}
