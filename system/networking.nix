{ pkgs, ... }: {
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      dispatcherScripts = [
        {
          source = pkgs.writeShellScript "disable-wifi-on-wired" ''
            interface=$1
            action=$2

            if [[ "$interface" == "lo" || "$interface" == docker* || "$interface" == veth* || "$interface" == virbr* ]]; then
                exit 0
                fi

            is_wifi=0
            if [ -d "/sys/class/net/$interface/wireless" ] || [ -d "/sys/class/net/$interface/phy80211" ]; then
                is_wifi=1
                fi
            if [ $is_wifi -eq 0 ]; then
                if [ "$action" = "up" ]; then
                        ${pkgs.networkmanager}/bin/nmcli radio wifi off
                    elif [ "$action" = "down" ]; then
                        ${pkgs.networkmanager}/bin/nmcli radio wifi on
                    fi
                fi
          '';
          type = "basic";
        }
      ];
    };
    firewall = rec {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
