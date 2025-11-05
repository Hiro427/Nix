{ config, pkgs, ... }: {
  programs.yazi = {
    enable = true;

    settings = {
      mgr = {
        show_hidden = false;
        sort_by = "natural";
      };
      opener = {
        play = [
          {
            run = ''mpv "$@"'';
            orphan = true;
            for = "unix";
          }
          {
            run = ''"C:\Program Files\mpv.exe" %*'';
            orphan = true;
            for = "windows";
          }
        ];

        edit = [
          {
            run = ''$EDITOR "$@"'';
            block = true;
            for = "unix";
          }
          {
            run = "%EDITOR% %*";
            block = true;
            for = "windows";
          }
        ];

        open = [{
          run = ''xdg-open "$@"'';
          desc = "Open";
        }];
      };
    };
  };
}
