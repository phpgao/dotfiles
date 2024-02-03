#!/usr/bin/env bash

# 如果当前shell为zsh，则设置zsh插件路径
if [[ "$SHELL" == "/bin/zsh" ]]; then
    export PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"
    export PLUGINS=("zsh-navigation-tools" "zsh-syntax-highlighting" "zsh-autosuggestions")
fi
