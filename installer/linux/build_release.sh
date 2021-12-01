#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Build Client
function oda_preflight {
    flatpak install --assumeyes flathub \
        org.freedesktop.Platform//21.08 \
        org.freedesktop.Sdk//21.08
}

function oda_build_client {
    rm -rf "$SCRIPT_DIR/.flatpak-builder" "$SCRIPT_DIR/build_client"
    flatpak-builder -v build_client net.odamex.Odamex.yaml
}

oda_preflight
oda_build_client
