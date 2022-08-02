{pkgs ? import <nixpkgs> {}}:
let
  alamgu = import (fetchTarball "https://github.com/alamgu/alamgu/archive/develop.tar.gz") {};
  ledgerctl = alamgu.ledgerctl;
  this = ./.;
in
pkgs.writeScriptBin "load-app" ''
  #!/usr/bin/env bash

  cd ${this}
  ${ledgerctl}/bin/ledgerctl install -f ${this}/app.json
''
