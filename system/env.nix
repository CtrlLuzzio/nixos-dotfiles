{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      git
      curl
      python3
      cargo
      gnumake
      btrfs-progs
      ffmpegthumbnailer
      game-devices-udev-rules
      kitty
      os-prober
      bibata-cursors
    ];
    sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Ice";
      XCURSOR_SIZE = "22";
    };
  };
}
