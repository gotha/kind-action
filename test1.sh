#!/usr/bin/env bash

install_kubectl() {
    echo 'Installing kubectl...'

    mkdir -p "${kubectl_dir}"

    curl -sSLo "${kubectl_dir}/kubectl" "https://dl.k8s.io/release/${kubectl_version}/bin/linux/${arch}/kubectl"
    chmod +x "${kubectl_dir}/kubectl"
}

main() {
  local cache_dir="${RUNNER_TOOL_CACHE}/kind/${version}/${arch}"
  echo "cache_dir: $cache_dir"
  
  local kubectl_dir="${cache_dir}/kubectl/bin/"
  echo "kubectl_dir: $kubectl_dir"
  if [[ ! -x "${kubectl_dir}/kubectl" ]]; then
      install_kubectl
  fi
  
  echo 'Adding kubectl directory to PATH...'
  echo "${kubectl_dir}" >> "${GITHUB_PATH}"
}

main
echo "test1 done"
echo "======================"
