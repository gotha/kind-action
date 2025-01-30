#!/usr/bin/env bash

arch
case $(uname -m) in
    x86_64)             arch="x86_64" ;;
    arm|aarch64|arm64)  arch="arm" ;;
    *) exit 1 ;;
esac

today=$(date +'%Y-%m-%d')
cache_dir="${RUNNER_TOOL_CACHE}/tmp/${today}/${arch}"
mkdir -p "${cache_dir}/tmp"
install_dir="${cache_dir}/cowsay/bin/"
mkdir -p "${install_dir}"


url="https://github.com/Code-Hex/Neo-cowsay/releases/download/v2.0.4/cowsay_2.0.4_Linux_$arch.tar.gz"
echo $url
curl -sSLo "${cache_dir}/cowsay.tar.gz" "$url"
tar -xvzf "${cache_dir}/cowsay.tar.gz" -C "${cache_dir}/tmp"

mv ${cache_dir}/tmp/cowsay "${install_dir}/cowsay"
chmod +x "${install_dir}/cowsay"

echo 'Adding cowsay directory to PATH...'
echo "${install_dir}" >> "${GITHUB_PATH}"
