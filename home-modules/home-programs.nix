{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.ags.homeManagerModules.default
    inputs.zen-browser.homeModules.beta
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
    zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      profiles.default = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "devtools.chrome.enabled" = true;
          "zen.view.use-single-toolbar" = false;
        };
        userChrome = ''
          @import "${config.home.homeDirectory}/.cache/noctalia/zen-browser/zen-userChrome.css";
        '';
        userContent = ''
          @import "${config.home.homeDirectory}/.cache/noctalia/zen-browser/zen-userContent.css";
        '';
        mods = [
          "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
          "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
          "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
          "bd92a9a0-1c00-4187-a66e-94c389fa5a59" # Sidebar Expand on Hover
          "a5f6a231-e3c8-4ce8-8a8e-3e93efd6adec" # Cleaned URL bar
        ];
        search = {
          force = true;
          default = "google";
        };
      };
    };
  };
}
