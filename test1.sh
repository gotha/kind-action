#!/usr/bin/env bash

echo "======================"
cat ${GITHUB_PATH}
echo "............................"
echo $PATH

echo "/opt/gotha/bin" >> "${GITHUB_PATH}"
echo "test1 executed"
echo "======================"
