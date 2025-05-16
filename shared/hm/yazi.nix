{
    config, 
    pkgs,
    ...
}: 
{
  programs.yazi = {
  enable = true;
  settings = {
  manager = {
      sort_by = "mtime";
      show_hidden = true;
    };
    open = {
      # Define commands
      edit = [
        "nvim \"$@\""
      ];
      feh = [
        "feh \"$@\""
      ];
      zathura = [
        "zathura \"$@\""
      ];
      mpv = [
        "vlc \"$@\""
      ];

      # Rules for file types
      rules = [
        {
          mime = "text/*";
          use = "edit";
        }
        {
          mime = "image/*";
          use = "feh";
        }
        {
          mime = "application/pdf";
          use = "zathura";
        }
        {
          mime = "video/*";
          use = "mpv";
        }
      ];
    };
  };
};

}
