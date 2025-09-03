{ config, pkgs, ... }: {
  programs.spotify-player = {
    enable = true;
    settings = {
      # cover_img_length = 20; 
      # cover_img_width = 10;

      enable_notify = true;
      device = { volume = 100; };
      layout = {
        # playback_window_height = 7;
        library = {
          playlist_percent = 60;
          album_percent = 25;
        };
      };

      # client_id_command = {
      #     command = "cat";
      #     args = [
      #         "${config.home.homeDirectory}/Nix/dots/secrets/spotify-id.txt"
      #     ];
      # };
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
