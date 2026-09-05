{ ... }: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    keyboard = {
      qmk = {
        enable = true;
        keychronSupport = true;
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
