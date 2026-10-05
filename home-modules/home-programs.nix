{ pkgs, inputs, ... }: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];
  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "CtrlLuzzio";
        init.defaultBranch = "main";
      };
      includes = [
        { path = "~/.gitconfig.local"; }
      ];
    };
    mangohud = {
      enable = true;
    };
    yazi = {
      enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        btw = "echo I use NixOS, btw";
        zed = "zeditor";
        nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#$(hostname)";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "fzf"
          "extract"
          "history-substring-search"
        ];
      };
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
      initContent = ''
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi

        if [[ -z "$ZELLIJ" && -n "$PS1" ]]; then
          exec zellij -l welcome
        fi

        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
    };
    bash = {
      enable = true;
      shellAliases = {
        btw = "echo I use NixOS, btw";
        zed = "zed";
        nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#$(hostname)";
      };

      profileExtra = ''
        [[ -f ~/.bashrc ]] && . ~/.bashrc
      '';

      initExtra = ''
        PS1='[\u@\h \W]\$ '
      '';
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    vscode = {
      enable = true;
      package = pkgs.vscode.fhsWithPackages (ps: with ps; [
        brotli
        zlib
        qt6.qtdeclarative
      ]);
    };
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
        obs-vkcapture
        # obs-composite-blur
      ];
    };
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
      enableZshIntegration = true;
    };
    quickshell = {
      enable = true;
    };
    ags = {
      enable = true;
      configDir = null;
      extraPackages = with pkgs; [
        inputs.astal.packages.${pkgs.system}.hyprland
        inputs.astal.packages.${pkgs.system}.wireplumber
        inputs.astal.packages.${pkgs.system}.tray
        inputs.astal.packages.${pkgs.system}.mpris
        inputs.astal.packages.${pkgs.system}.network
        inputs.astal.packages.${pkgs.system}.notifd
        inputs.astal.packages.${pkgs.system}.bluetooth
        inputs.astal.packages.${pkgs.system}.apps
        dart-sass
      ];
    };
  };
}
