#!/usr/bin/env bash

# Disable filename globbing if using zsh
if [ -n "$ZSH_VERSION" ]; then
    setopt NO_NOMATCH
fi

# Base directory for dotfiles
BASE_DIR="${HOME}/.dotfiles"
DEBUG=1

# Print system information
print_system_info() {
    # Basic system information
    local os="$(uname)"
    local os_name="$(uname -s)"
    local kernel_version="$(uname -r)"
    local hostname="$(uname -n)"
    local arch="$(uname -m)"
    local current_time="$(date +"%Y-%m-%d %H:%M:%S")"

    # Fetch CPU and memory information based on operating system
    local cpu_model=""
    local memory_total=""
    local memory_used=""
    local uptime=""

    if [ "${os}" = "Darwin" ]; then
        # macOS specifics for fetching system details
        cpu_model="$(sysctl -n machdep.cpu.brand_string)"
        memory_total="$(sysctl -n hw.memsize | awk '{print int($1/1073741824) " GB"}')"
        local pages_free="$(vm_stat | grep "Pages free" | awk '{print $3}' | tr -d '.')"
        local pages_active="$(vm_stat | grep "Pages active" | awk '{print $3}' | tr -d '.')"
        local pages_inactive="$(vm_stat | grep "Pages inactive" | awk '{print $3}' | tr -d '.')"
        memory_used="$(awk "BEGIN {print ($pages_active + $pages_inactive) * 4096 / 1073741824}" | xargs | awk '{printf "%.2f GB", $1}')"
        uptime="$(uptime)"
    else
        # Assume Linux-based system details
        cpu_model="$(lscpu | grep "Model name" | sed -e 's/Model name:[[:space:]]*//')"
        memory_total="$(free -h | grep Mem | awk '{print $2}')"
        memory_used="$(free -h | grep Mem | awk '{print $3}')"
        uptime="$(uptime -p)"
    fi
    
    # Disk information
    local disk_total=""
    local disk_used=""
    
    if [ "${os}" = "Darwin" ]; then
        disk_total="$(df -Hl / | tail -1 | awk '{print $2}')"
        disk_used="$(df -Hl / | tail -1 | awk '{print $3}')"
    else
        disk_total="$(df -h / | awk 'NR==2{print $2}')"
        disk_used="$(df -h / | awk 'NR==2{print $3}')"
    fi
    
    # IP Information
    local ip=""
    
    if hash ip 2>/dev/null; then
        ip="$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | head -1 | cut -d/ -f1)"
    elif hash ifconfig 2>/dev/null; then
        ip="$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | head -1)"
    fi

    # Output the gathered information
    echo "System Info:"
    echo "Hostname:          ${hostname}"
    echo "Operating System:  ${os_name}"
    echo "Kernel Version:    ${kernel_version}"
    echo "Architecture:      ${arch}"
    echo "CPU Model:         ${cpu_model}"
    echo "Memory:            Total: ${memory_total}, Used: ${memory_used}"
    echo "Disk:              Total: ${disk_total}, Used: ${disk_used}"
    echo "Uptime:            ${uptime}"
    echo "IP Address:        ${ip}"
    echo "Current Time:      ${current_time}"
}

# Call the function to print the system info
print_system_info

# Execute shell script file
execute_shell() {
    local file="$1"
    local current_shell=$(basename "$SHELL")

    if [[ "$current_shell" == "bash" || "$current_shell" == "zsh" || "$current_shell" == "ksh" ]]; then
        source "$file"
        [ -n "$DEBUG" ] && echo -e "\033[1;34mSourced $file\033[0m"
    else
        echo "Unsupported Shell: $current_shell"
        return 1
    fi
}

# Iterate through directories and source scripts
source_scripts() {
    local os=$(uname | tr '[:upper:]' '[:lower:]')
    local arch=$(uname -m | tr '[:upper:]' '[:lower:]')

    # Normalize architecture names
    case "$arch" in
        arm* | aarch64*) arch="arm" ;;
    esac

    # Array of folders to look for scripts to source
    local folders=("path" "env" "config" "function" "plugin" "alias" "bind")
    local folder_path os_folder os_arch_folder machine_specific_file

    for folder in "${folders[@]}"; do
        folder_path="${BASE_DIR}/${folder}"

        if [ -d "$folder_path" ]; then
            for file in "$folder_path"/*.sh; do
                [ -f "$file" ] && execute_shell "$file"
            done
        fi

        os_folder="${folder_path}/${os}"
        [ -d "$os_folder" ] && source_all "$os_folder"

        os_arch_folder="${folder_path}/${os}/${arch}"
        [ -d "$os_arch_folder" ] && source_all "$os_arch_folder"

        if [ -n "$MACHINE" ]; then
            machine_specific_file="${BASE_DIR}/machine/${MACHINE}/${folder}.sh"
            [ -f "$machine_specific_file" ] && execute_shell "$machine_specific_file"
        fi
    done
}

# Helper function to source all scripts in a directory
source_all() {
    for file in "$1"/*.sh; do
        [ -f "$file" ] && execute_shell "$file"
    done
}

# Source scripts
source_scripts

# Source oh-my-zsh if using zsh
[ -n "$ZSH_VERSION" ] && source "${HOME}/.oh-my-zsh/oh-my-zsh.sh"