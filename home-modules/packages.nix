{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home = {
    packages = with pkgs; [
      vesktop
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
      swaynotificationcenter
      hyprpolkitagent
      hyprshutdown
      awww
      file-roller
      zellij
      protonup-ng
      lazygit
      vimPlugins.lazygit-nvim
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
      nautilus
      nautilus-open-any-terminal
      sushi
      inputs.oniri.packages.${pkgs.system}.default
      (writeShellScriptBin "gamescope-run" ''
        gamescope_args=()
        game_cmd=()
        sep_found=false

        for arg in "$@"; do
          if [[ "$arg" == "--" && "$sep_found" == "false" ]]; then
            sep_found=true
          elif [[ "$sep_found" == "true" ]]; then
            game_cmd+=("$arg")
          else
            gamescope_args+=("$arg")
          fi
        done

        # No -- provided: treat everything as the game command
        if [[ "$sep_found" == "false" ]]; then
          game_cmd=("''${gamescope_args[@]}")
          gamescope_args=()
        fi

        exec env LD_PRELOAD= ${pkgs.gamescope}/bin/gamescope \
          "''${gamescope_args[@]}" \
          -- env LD_PRELOAD="$LD_PRELOAD" "''${game_cmd[@]}"
      '')
    ];
  };
}
