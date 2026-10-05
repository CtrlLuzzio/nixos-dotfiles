{
  config,
  ...
}:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    btop = "btop";
    cliphist = "cliphist";
    hypr = "hypr";
    waybar = "waybar";
    swaync = "swaync";
    fuzzel = "fuzzel";
    fetch = "fetch";
    foot = "foot";
    yazi = "yazi";
    zellij = "zellij";
    mango = "mango";
    niri = "niri";
    matugen = "matugen";
    nvim = "nvim";
    walker = "walker";
    wlogout = "wlogout";
    rofi = "rofi";
    zed = "zed";
    themes = "themes";
    quickshell = "quickshell";
    ags = "ags";
    wallpapers = "wallpapers";
    "fontconfig/fonts.conf" = "fontconfig/fonts.conf";
  };
in
{
  home = {
    file = {
      ".p10k.zsh" = {
        source = create_symlink "${dotfiles}/shell/zsh/.p10k.zsh";
      };
    };
  };
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
  }) configs;
}
