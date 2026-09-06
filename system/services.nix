{ pkgs, ... }:
let
  sddm-astronaut = (
    pkgs.sddm-astronaut.override {
      embeddedTheme = "pixel_sakura";
    }
  );
in
{
  environment.systemPackages = [ sddm-astronaut ]; #Here bc if not the sddm theme doesn't work
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        theme = "sddm-astronaut-theme";
        package = pkgs.kdePackages.sddm;
        extraPackages = with pkgs; [
          kdePackages.qtmultimedia
          kdePackages.qtsvg
          kdePackages.qtdeclarative
        ];
        settings = {
          Theme = {
            CursorTheme = "Bibata-Modern-Ice";
          };
        };
      };
    };
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
    };
    gvfs = {
      enable = true;
    };
    udisks2 = {
      enable = true;
    };
    tumbler = {
      enable = true;
    };
    flatpak = {
      enable = true;
      update = {
        onActivation = true;
      };
      packages = [
        "com.spotify.Client"
        "info.cemu.Cemu"
        "org.DolphinEmu.dolphin-emu"
        "com.github.tchx84.Flatseal"
        "net.kuribo64.melonDS"
        "app.zen_browser.zen"
      ];
      overrides = {
        global = {
          Context.filesystems = [
            "~/.icons:ro"
            "~/.local/share/icons:ro"
            "~/icons:ro"
            "~/.themes:ro"
          ];
        };
      };
    };
    blueman = {
      enable = true;
    };
    libinput = {
      enable = true;
    };
    snapper = {
      configs = {
        home = {
          SUBVOLUME = "/home";
          ALLOW_USERS = [ "luzzio" ];
          TIMELINE_CREATE = true;
          TIMELINE_CLEANUP = true;
          TIMELINE_LIMIT_HOURLY = "5";
          TIMELINE_LIMIT_DAILY = "7";
          TIMELINE_LIMIT_WEEKLY = "2";
          TIMELINE_LIMIT_MONTHLY = "0";
          TIMELINE_LIMIT_YEARLY = "0";
        };
        root = {
          SUBVOLUME = "/";
          TIMELINE_CREATE = true;
          TIMELINE_CLEANUP = true;
          TIMELINE_LIMIT_HOURLY = "3";
          TIMELINE_LIMIT_DAILY = "3";
          TIMELINE_LIMIT_WEEKLY = "0";
          TIMELINE_LIMIT_MONTHLY = "0";
          TIMELINE_LIMIT_YEARLY = "0";
        };
      };
    };
  };
}
