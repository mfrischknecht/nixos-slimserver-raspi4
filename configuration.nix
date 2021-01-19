{ config, pkgs, lib, ... }:
{
  services.sshd.enable = true;
  networking.hostName = "nixos";

  imports = [
    ./secrets.nix
  ];

  environment.systemPackages = with pkgs; [ vim git tmux htop ];

  users.users.nixos = {
    isNormalUser = true;
    home = "/home/nixos";
    extraGroups = [ "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
  boot.loader.grub.enable = false;
  boot.loader.raspberryPi.enable = true;
  boot.loader.raspberryPi.version = 4;
  boot.kernelPackages = pkgs.linuxPackages_rpi4;
  boot.kernelParams = ["cma=256M"];
  hardware.enableRedistributableFirmware = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };

  swapDevices = [ { device = "/swapfile"; size = 1024; } ];
}
