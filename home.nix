{
  ...
}:
{
  imports = [
    ./home-modules/dotfiles.nix
    ./home-modules/home-env.nix
    ./home-modules/packages.nix
    ./home-modules/home-programs.nix
    ./home-modules/home-services.nix
    ./home-modules/theme.nix
  ];

  home = {
    username = "luzzio";
    homeDirectory = "/home/luzzio";
    stateVersion = "26.05";
  };
}
