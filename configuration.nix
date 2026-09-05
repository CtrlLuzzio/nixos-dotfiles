{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./hardware-configuration.nix
    ./system/boot.nix
    ./system/networking.nix
    ./system/services.nix
    ./system/hardware.nix
    ./system/programs.nix
    ./system/users.nix
    ./system/nix-config.nix
    ./system/env.nix
    ./system/fonts.nix
    ./system/file-systems.nix
  ];

  time = {
    timeZone = "America/Caracas";
  };

  i18n = {
    defaultLocale = "es_VE.UTF-8";
  };

  virtualisation = {
    docker = {
      enable = true;
    };
  };

  security = {
    polkit = {
      enable = true;
    };
  };

  system.stateVersion = "26.05";
}
