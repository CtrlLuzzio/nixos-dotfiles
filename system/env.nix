{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      git
      curl
      unzip
      jq
      jq-zsh-plugin
      python3
      cargo
      gnumake
      btrfs-progs
      ffmpegthumbnailer
      game-devices-udev-rules
      kitty
      os-prober
      bibata-cursors
      xwayland-satellite
      adw-gtk3
    ];
    sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Ice";
      XCURSOR_SIZE = "22";
    };
  };
}
