#!/usr/bin/env bash

# 更新Homebrew及其所有包
brew update        # 更新Homebrew的数据库
brew upgrade       # 升级所有已安装的包

# --- 基础工具 ---

# 更新基础Unix工具：安装GNU版本替换部分macOS默认的BSD工具
brew install coreutils findutils gnu-sed moreutils

# 流编辑器：替换默认的BSD sed
brew install gnu-sed

# 文件下载工具
brew install wget curl

# --- 文件和磁盘管理工具 ---

# 表现Disk使用情况的工具
brew install ncdu

# 交互式进程查看器
brew install htop

# 文本处理工具
brew install vim grep ack tree pv rename vbindiff lynx

# 加强命令行交互体验
brew install rlwrap

# --- 版本控制工具 ---

# Git工具和大文件支持
brew install git git-lfs bfg

# --- 网络和通讯工具 ---

# JSON处理工具
brew install jq

# 网络HTTP客户端，更现代的命令行方式
brew install httpie

# 安全相关工具
brew install gnupg

# 网络性能分析工具
brew install socat tcpflow tcpreplay tcptrace nmap

# TCP网络工具
brew install ucspi-tcp

# SSH和多会话支持
brew install openssh screen

# Android平台开发工具
brew install --cask android-platform-tools

# --- 开发工具 ---

# 压缩/解压缩工具
brew install xz pigz zopfli p7zip

# 编程语言环境
brew install php lua go node rust

# --- 图像和视频处理工具 ---

# 图像处理工具
brew install imagemagick

# 视频处理工具
brew install ffmpeg

# 文档转换工具
brew install pandoc

# --- gRPC 开发工具 ---

# 远程过程调用框架和相应的GO工具
brew install grpc protobuf protoc-gen-go protoc-gen-go-grpc proto-gen-validate

# --- 数据库工具 ---

# 数据库交互工具
brew install mycli postgresql mysql redis

# 其他开发相关工具
brew install bat kubectl mtr gdb make cmake fswatch diffutils

# --- 系统监控与性能分析工具 ---

# 系统监视工具
brew install powertop dstat glances nmon ctop bwm-ng 

# 网络监控工具
brew install wireshark-cli iptraf-ng smartctl tcpdump

# 日志和系统输出工具
brew install multitail lnav

# 命令行忘记指令?
brew install tldr

# 命令行输出美化工具
brew install figlet colordiff diff-so-fancy

# 查询网络状态和增强网络诊断工具
brew install mtr axel 

# 文件传输工具
brew install lrzsz

# 统计代码行数工具
brew install cloc

# 日志实时展览工具
brew install multitail

# 命令行技巧学习工具
brew install tldr

# 生成文本大标题工具
brew install figlet

# 终端系统监控工具
brew install nmon ctop

# 快速文件搜索工具
brew install fd z ripgrep

# 增强版的目录树展示工具
brew install tree

# 命令行系统信息展示工具
brew install glances

# 比较文件与文件夹大小的工具
brew install dust

# 资源监控工具
brew install bottom

# 清理Homebrew缓存，移除不再需要的版本
brew cleanup
