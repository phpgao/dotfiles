#!/usr/bin/env bash

export PATH="$HOME/bin:$PATH"

# 对于 macOS
export PATH="/usr/local/sbin:$PATH"
# 对于大多数Linux发行版
export PATH="/usr/sbin:/sbin:$PATH"

# 添加Go安装路径
export PATH="/usr/local/go/bin:$PATH"

# 添加Rust工具链路径
export PATH="$HOME/.cargo/bin:$PATH"

# 添加Python虚拟环境路径
export PATH="$HOME/.local/bin:$PATH"

# 添加Node.js全局安装路径
export PATH="$HOME/.yarn/bin:$PATH"

# 添加Yarn全局安装路径
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# 添加Ruby版本管理器路径
export PATH="$HOME/.rbenv/bin:$PATH"
