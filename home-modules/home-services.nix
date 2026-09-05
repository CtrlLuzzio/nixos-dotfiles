{ ... }: {
  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
  systemd = {
    user = {
      targets = {
        hyprland-session = {
          Unit = {
            Description = "Hyprland session";
            BindsTo = [ "graphical-session.target" ];
            Wants = [ "graphical-session-pre.target" ];
            After = [ "graphical-session-pre.target" ];
            PropagatesStopTo = [ "graphical-session.target" ];
          };
        };
      };
    };
  };
}
