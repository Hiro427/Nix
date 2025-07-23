{ config, pkgs,

lib, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      scan_timeout = 10;
      add_newline = true;
      character = {
        format = "$symbol ";
        success_symbol = "[ 󱓟](green)";
        error_symbol = "[ 󱓟](red)";
      };
      directory = {
        home_symbol = "";
        format = "[$path ](lavender)[$read_only](red)";
        read_only = " ";
      };
      golang = {
        symbol = " ";
        format = "[$symbol$version](sky)";
      };
      c = {
        symbol = " ";
        format = "[$symbol$version]($style)";
        style = "blue";
      };
      python = {
        format = "[$symbol$version](yellow)";
        symbol = " ";
      };
      java = {
        symbol = "󰬷 ";
        format = "[$symbol$version]($style)";
        style = "red";
      };
      rust = {
        format = "[$symbol$version]($style)";
        symbol = " ";
        style = "bold peach";
      };
      lua = {
        symbol = " ";
        format = "[$symbol$version]($style)";
      };
      jobs = {
        format = "[$symbol$number]($style) ";
        style = "text";
        symbol = "[󱃐](mauve italic)";
      };
      aws = {
        format = "[$symbol $profile $region]($style)";
        style = "bold peach";
        symbol = " ";

      };
      docker_context = {
        symbol = " ";
        format = "[$symbol$context]($style)";
      };

      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$golang"
        "$lua"
        "$python"
        "$c"
        "$rust"
        "$line_break"
        "$character"
      ];
      right_format = lib.concatStrings [ "$jobs" "$aws" "$docker_context" ];
    };
  };
}
