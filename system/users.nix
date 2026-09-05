{ pkgs, ... }: {
  users = {
    users = {
      luzzio = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "docker"
        ];
        packages = with pkgs; [
          tree
          btop
        ];
        shell = pkgs.zsh;
      };
    };
  };
}
