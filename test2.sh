#!/usr/bin/env bash

echo "========================"
cat ${GITHUB_PATH}
echo "............................"
echo $PATH
echo "............................"
which kubectl
kubectl -h
echo "test2 done"
echo "========================"
