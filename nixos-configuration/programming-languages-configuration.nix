{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # BEAM Languages
    elixir
    erlang_27
    inotify-tools
    livebook

    # Clojure
    clj-kondo
    clojure
    clojure-lsp
    clooj
    leiningen

    # Haskell
    cabal-install
    haskell.compiler.native-bignum.ghc948
    haskell-language-server
    stack

    # Python
    python311Full
    python311Packages.pip

    # Java
    gradle
    maven
    temurin-bin-21

    # Fun Languages #
    go
    lua
    racket
    rustup
    zig

    # Obscure Languages
    gforth
    gnu-cim
    gnuapl
    gnum4
    pforth
    snobol4
  ];

}
