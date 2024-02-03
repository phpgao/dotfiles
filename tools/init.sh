#!/usr/bin/env bash

BASE_DIR="$HOME/.dotfiles"

folders=("env" "path" "config" "function" "plugin" "alias" "bind")
os_types=("linux" "darwin")
arch_types=("x86_64" "arm")

for folder in "${folders[@]}"; do
    for os in "${os_types[@]}"; do
        for arch in "${arch_types[@]}"; do
            dir_path="${BASE_DIR}/${folder}/${os}/${arch}"
            gitignore_path="${dir_path}/.gitignore"
            mkdir -p "$dir_path"
            touch "$gitignore_path"
        done
    done
done
