#!/usr/bin/env bash

echo "========================"
cat ${GITHUB_PATH}
echo "PATH:............................"
echo $PATH
echo "which:............................"
which kubectl
echo "kbch: ............................"
kubectl -h
echo "test2 done"
echo "========================"
