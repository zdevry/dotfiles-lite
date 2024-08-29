#!/usr/bin/bash
set -euo pipefail

if [[ -z "${2+set}" ]]; then
    echo "Provide two arguments"
    exit 1
fi

[[ -z "${STEAMLIB_PATHS+set}" ]] \
    && STEAMLIB_PATHS="/data/SteamLibrary:$HOME/.steam/steam"
[[ -z "${STEAM_COMPAT_CLIENT_INSTALL_PATH+set}" ]] \
    && STEAM_COMPAT_CLIENT_INSTALL_PATH="$HOME/.steam/steam"
export STEAM_COMPAT_CLIENT_INSTALL_PATH
[[ -z "${PROTON_BIN+set}" ]] \
    && PROTON_BIN="$HOME/.steam/steam/steamapps/common/Proton - Experimental/proton"

get_app_compatdata_path() {
    IFS=':' read -ra steamlib_paths <<< "$STEAMLIB_PATHS"
    for path in "${steamlib_paths[@]}"; do
        if [[ -d "$path/steamapps/compatdata/$1" ]]; then
            echo "$path/steamapps/compatdata/$1"
            return
        fi
    done
    return 1
}

if ! STEAM_COMPAT_DATA_PATH="$(get_app_compatdata_path "$1")"; then
    echo "No game with ID $1 found"
    exit 1
fi
export STEAM_COMPAT_DATA_PATH

[[ -f "$2" ]] && "$PROTON_BIN" run "$2"
