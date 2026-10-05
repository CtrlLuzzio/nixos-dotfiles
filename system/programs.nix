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
    noctalia = {
      enable = true;
    };
    niri = {
      enable = true;
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
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        brotli
        zlib
        stdenv.cc.cc.lib
        unixodbc
        glib
      ];
    };
    ssh = {
      startAgent = false;
    };
    nm-applet = {
      enable = false;
    };
  };
}
