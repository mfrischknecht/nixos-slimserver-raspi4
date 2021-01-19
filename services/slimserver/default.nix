{ config, pkgs, lib, ... }:

let spotty = pkgs.callPackage (import ./spotty.nix) {};
in
{
  services.slimserver.enable = true;
  systemd.services.slimserver.path = [ spotty ];
  networking.firewall.allowedTCPPorts = [ 9000 9090 3438 ];
}
