{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  services.xserver = {
    displayManager.lightdm.enable = true;
    enable = true;
    windowManager.bspwm.enable = true;
  };

  system.stateVersion = "23.11";
  time.timeZone = "Europe/Moscow";

  users.users.sery = {
    extraGroups = [
      "wheel"
    ];

    isNormalUser = true;
  };
}
