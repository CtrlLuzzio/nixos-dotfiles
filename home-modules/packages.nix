{
  config,
  pkgs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      fastfetch
      killall
      foot
      neovim
      ripgrep
      nil
      nixfmt
      alejandra
      nodejs
      gcc
      waybar
      pwvucontrol
      nwg-look
      kdePackages.qt6ct
      kdePackages.qtstyleplugin-kvantum
      networkmanagerapplet
      swaynotificationcenter
      hyprpolkitagent
      hyprshutdown
      awww
      file-roller
      zellij
      protonup-ng
      lazygit
      vimPlugins.lazygit-nvim
      blueman
      ferdium
      libnotify
      wl-clipboard
      wl-clip-persist
      cliphist
      zed-editor
      wlogout
      onlyoffice-desktopeditors
      nixd
      heroic
      cookiecutter
      docker-compose
      poedit
      grim
      slurp
      fzf
      tree-sitter
      satty
      wayfreeze
      hunspell
      hunspellDicts.es-ve
      unrar
      dusklight
      srb2
      via
      chatterino7
      (rofi.override { plugins = [ rofi-calc ]; })
      rofimoji
      yt-dlp
      discord
      kdePackages.kdenlive
      matugen
      papirus-icon-theme
      (writeShellScriptBin "zen-browser" ''
        exec flatpak run app.zen_browser.zen "$@"
      '')
      (writeShellScriptBin "change-theme" ''
        exec ${config.home.homeDirectory}/dotfiles/scripts/change_theme.sh "$@"
      '')
      (writeShellScriptBin "change-wallpaper" ''
        exec ${config.home.homeDirectory}/dotfiles/scripts/change_wallpaper.sh "$@"
      '')
      fetch
      modrinth-app
    ];
  };
}