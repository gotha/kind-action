#!/usr/bin/env bash

version="v1.31.4"
arch
case $(uname -m) in
    i686)               arch="386" ;;
    x86_64)             arch="amd64" ;;
    arm|aarch64|arm64)  arch="arm64" ;;
    *) exit 1 ;;
esac

cache_dir="${RUNNER_TOOL_CACHE}/tmp/${version}/${arch}"
echo "cache_dir: $cache_dir"

kubectl_dir="${cache_dir}/kubectl/bin/"
echo "kubectl_dir: $kubectl_dir"
mkdir -p "${kubectl_dir}"
ls -las "$kubectl_dir"

echo "https://dl.k8s.io/release/${version}/bin/linux/${arch}/kubectl"
curl -sSLo "${kubectl_dir}/kubectl" "https://dl.k8s.io/release/${version}/bin/linux/${arch}/kubectl"
chmod +x "${kubectl_dir}/kubectl"

echo 'Adding kubectl directory to PATH...'
echo "${kubectl_dir}" >> "${GITHUB_PATH}"
