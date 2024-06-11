{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bruno
    cmake
    docker
    gcc13
    git
    gnumake
    libtool
    podman
  ];

}
