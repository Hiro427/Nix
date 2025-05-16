{
    config, 
    pkgs, 
    ...
}: 
{
    programs.chromium = {
        enable = true;
        package = pkgs.brave; 
        extensions = [
            {
                id = "kekjfbackdeiabghhcdklcdoekaanoel"; #Mal-Sync
            }
            {
                id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; #Ublock Origin
            }
            {
                id = "nngceckbapebfimnlniiiahkandclblb"; #bitwarden
            }
            # {
            #     id = "dbfoemgnkgieejfkaddieamagdfepnff"; #2fas
            #
            # }
            {
                id = "clngdbkpkpeebahjckkjfobafhncgmne"; #Stylus
            }
            {
                id = "dbepggeogbaibhgnhhndojpepiihcmeb"; #Vimium
            }
            {
                id = "ldjkgaaoikpmhmkelcgkgacicjfbofhh"; #instapaper
            }
            {
                id = "ghkdkllgoehcklnpajjjmfoaokabfdfm"; #remove paywall
            }
            {
                id = "ponfpcnoihfmfllpaingbgckeeldkhle"; #youtube enhancer
            }
            {
                id = "lnjaiaapbakfhlbjenjkhffcdpoompki"; #catppuccin icons
            }
            {
                id = "hkgfoiooedgoejojocmhlaklaeopbecg";
            }

        ];
    };
}
