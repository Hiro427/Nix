{
  config,
  pkgs,
  theme,
  ...
}:
{

  programs.qutebrowser.enable = true;
  programs.qutebrowser = {
    extraConfig = ''
      c.tabs.show = "never" #switching
      # c.tabs.show_switching_delay = 1000
      c.tabs.position = "top"
      c.statusbar.show = "in-mode"
      c.auto_save.session = True
      c.colors.webpage.preferred_color_scheme = "dark"
      c.scrolling.smooth = True  
      # c.url.searchengines = {"DEFAULT": "https://search.brave.com/search?q={}"}
      c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}"}
      c.url.start_pages = "https://duckduckgo.com"
      c.window.transparent = True
      c.colors.webpage.darkmode.enabled = True
      # config.set(
      #   "content.user_stylesheets",
      #   ["~/Nix/dots/stylesheets/styles.css"],
      # )
      c.fileselect.handler = "external"
      yazi_chooser = [
        "foot",
        "--title",
        "yazi-flt",
        "yazi",
        "--chooser-file",
        "{}",
      ]
      c.fileselect.single_file.command = yazi_chooser
      c.fileselect.multiple_files.command = yazi_chooser
      c.fileselect.folder.command = yazi_chooser

    '';
  };
}
