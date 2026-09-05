{
  pkgs,
  ...
}: {
  boot = {
    loader = {
      timeout = 10;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        configurationLimit = 10;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}