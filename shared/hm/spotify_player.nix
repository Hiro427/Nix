{
    config, 
    pkgs, 
    ...
}: 
{
  programs.spotify-player = {
        enable = true;
        settings = {
            playback_window_position = "Top";
            playback_window_height = 60;

            enable_notify = false;


            client_id_command = {
                command = "cat";
                args = [
                    "${config.home.homeDirectory}/Nix/dots/secrets/spotify-id.txt"
                ];
            };
        };
        keymaps = [
            {
                command = "NextTrack";
                key_sequence = "g l";
            }
            {
                command = "PreviousTrack";
                key_sequence = "g h";
            }
        ];
    };
}
