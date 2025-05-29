{
    config, 
    pkgs, 
    ...
}: 
{
  programs.vesktop = {
        enable = true;
        vencord.settings = {
            autoUpdate = true;
            autoUpdateNotification = true;
            useQuickCss = true;
            # themeLinks = [
                #     "https://raw.githubusercontent.com/catppuccin/discord/refs/heads/main/themes/mocha.theme.css"
                # ];

        };
    };

}
