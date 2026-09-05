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
      sddm-astronaut
    ];
    sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Ice";
      XCURSOR_SIZE = "22";
    };
  };
}
