{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  services = {
    gvfs.enable = true;

    pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      pulse.enable = true;
    };

    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      windowManager.bspwm.enable = true;

      xkb = {
        layout = "us,ru";
        options = "grp:alt_shift_toggle";
      };
    };
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
