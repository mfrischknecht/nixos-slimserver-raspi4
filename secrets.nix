{ config, pkgs, lib, ... }:
{
  users.users.nixos = {
    # openssh.authorizedKeys.keys = [
    #    "ssh-ed25519 .."
    # ];
    # hashedPassword = "...";
  };
}
