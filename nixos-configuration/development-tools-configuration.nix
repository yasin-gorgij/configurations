{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bruno
    cmake
    gcc13
    git
    gnumake
    libtool
    podman
  ];

}
