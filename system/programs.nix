{ pkgs, ... }: {
  programs = {
    firefox = {
      enable = true;
    };
    hyprland = {
      enable = true;
      withUWSM = false;
      xwayland = {
        enable = true;
      };
    };
    zsh = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
        thunar-vcs-plugin
        thunar-media-tags-plugin
      ];
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
    steam = {
      enable = true;
      remotePlay = {
        openFirewall = true;
      };
    };
    nix-ld = {
      enable = true;
    };
    ssh = {
      startAgent = true;
    };
  };
}
