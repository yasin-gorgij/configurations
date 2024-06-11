{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arangodb
    dbeaver
    minio
    mysql80
    postgresql_16
    duckdb
    rethinkdb
  ];

  # Enable MySQL
  services.mysql = {
  enable = true;
  package = pkgs.mysql80;
  };

  # Enable PostgreSQL
  services.postgresql = {
    enable = true;
  };

}
