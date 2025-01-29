#!/usr/bin/env bash

main() {

  local version="v1.31.4"
  local arch
  case $(uname -m) in
      i686)               arch="386" ;;
      arm|aarch64|arm64)  arch="arm64" ;;
      *) exit 1 ;;
  esac

  local cache_dir="${RUNNER_TOOL_CACHE}/tmp/${version}/${arch}"
  echo "cache_dir: $cache_dir"

  local kubectl_dir="${cache_dir}/kubectl/bin/"
  echo "kubectl_dir: $kubectl_dir"
  mkdir -p "${kubectl_dir}"
  ls -las "$kubectl_dir"

  echo "https://dl.k8s.io/release/${version}/bin/linux/${arch}/kubectl"
  curl -sSLo "${kubectl_dir}/kubectl" "https://dl.k8s.io/release/${version}/bin/linux/${arch}/kubectl"
  chmod +x "${kubectl_dir}/kubectl"

  echo 'Adding kubectl directory to PATH...'
  echo "${kubectl_dir}" >> "${GITHUB_PATH}"
  echo "........................"
  cat "$GITHUB_PATH"
  echo "x........................"
  which kubectl
  echo "........................"
}

main

