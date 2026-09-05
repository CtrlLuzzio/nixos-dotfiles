{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      google-fonts
      carlito
      caladea
      noto-fonts-color-emoji
    ];
  };
}
