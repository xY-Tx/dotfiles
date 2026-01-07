#!/bin/bash
#
# Install dotfiles
#
set -euo pipefail

cd "$(dirname "$0")"

REPO_DIR="$(pwd)"
SCRIPT_NAME="$(basename "$0")"

function install_sub() {
    local execute=$1
    local path

    while IFS= read -rd '' path; do
        path="${path/.\//}"

        [[ "${path}" == "${SCRIPT_NAME}" ]] && continue
        [[ "${path}" =~ ^\.git(\/.*)?$ ]] && continue
        [[ "${path}" =~ \.DS_Store$ ]] && continue
        # 他に除外したいファイルがあればここに追加します

        if [[ -d "${path}" ]]; then
            if [[ "${execute}" = 'true' ]]; then
                mkdir -pv "${HOME}/${path}"
            else
                echo "  mkdir -pv ${HOME}/${path}"
            fi
        elif [[ -f "${path}" ]]; then
            if [[ "${execute}" = 'true' ]]; then
                ln -snfv "${REPO_DIR}/${path}" "${HOME}/${path}"
            else
                echo "   ln -snfv ${REPO_DIR}/${path} ${HOME}/${path}"
            fi
        fi
    done < <(find . -mindepth 1 -print0)
}

echo "Dry run:"
install_sub 'false'
echo

read -rp "ok? (y/N): " yn
case "${yn}" in
[yY]*)
    install_sub 'true'
    echo
    echo "finished"
    ;;
*)
    echo "abort"
    ;;
esac
