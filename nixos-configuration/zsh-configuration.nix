{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
  ];

  # zsh
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    zsh-autoenv.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "history" ];
      theme = "robbyrussell";
    };
  };

}
