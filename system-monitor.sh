#!/bin/bash

# Script to monitor system processes by CPU and VRAM usage
# Usage: ./top-cpu-processes.sh [option]
# Options:
#   cpu    - Show top processes using most CPU
#   vram   - Show top processes using most VRAM (GPU memory)
#   ram    - Show top processes using most RAM

show_cpu_usage() {
    echo "=== Top 5 Processes Using Most CPU ==="
    echo "USER     PID      CPU%     COMMAND"
    echo ""
    ps aux --sort=-%cpu | head -6 | awk 'NR>1 {printf "%-10s %-8s %6.2f%% %s\n", $1, $2, $3, $11}'
    echo ""
}

show_ram_usage() {
    echo "=== Top 5 Processes Using Most RAM ==="
    echo "USER     PID      MEM%     MEMORY(MB)   MEMORY(GB)  COMMAND"
    echo ""
    ps aux --sort=-%mem | head -6 | awk 'NR>1 {
        # Calculate memory in MB and GB
        mem_percent = $3
        mem_mb = $4 
        mem_gb = mem_mb / 1024
        
        # Format to show MB/GB with proper spacing
        printf "%-10s %-8s %6.2f%% %6s MB (%.2f GB) %s\n", $1, $2, mem_percent, mem_mb, mem_gb, $11
    }'
    echo ""
}

show_vram_usage() {
    echo "=== Top Processes Using Most VRAM ==="
    echo "PID      PROCESS NAME                          MEMORY (MB)   MEMORY (GB)"
    echo ""

    # Check if nvidia-smi is available
    if ! command -v nvidia-smi &> /dev/null; then
        echo "Error: nvidia-smi not found. Please install NVIDIA drivers."
        return 1
    fi

    # Get GPU memory usage by process and format output with MB/GB
    echo "GPU Memory Usage (MB/GB):"
    nvidia-smi --query-compute-apps=pid,process_name,used_memory --format=csv,noheader,nounits | \
    sort -k3 -nr | head -5 | while read line; do
        pid=$(echo "$line" | cut -d',' -f1 | tr -d ' ')
        process_name=$(echo "$line" | cut -d',' -f2 | tr -d ' ')
        memory_mb=$(echo "$line" | cut -d',' -f3 | tr -d ' ')

        # Convert MB to GB for display (2 decimal places)
        memory_gb=$(awk "BEGIN {printf \"%.2f\", $memory_mb/1024}")

        # Format output with proper spacing
        printf "%-8s %-35s %6s MB (%.2f GB)\n" "$pid" "$process_name" "$memory_mb" "$memory_gb"
    done

    echo ""
}

show_help() {
    echo "Usage: $0 [option]"
    echo ""
    echo "Options:"
    echo "  cpu    - Show top processes using most CPU"
    echo "  vram   - Show top processes using most VRAM (GPU memory)"
    echo "  ram    - Show top processes using most RAM"
    echo "  help   - Show this help message"
    echo ""
    echo "Example:"
    echo "  $0 cpu"
    echo "  $0 vram"
    echo "  $0 ram"
}

# Main script logic
case "$1" in
    cpu)
        show_cpu_usage
        ;;
    ram)
        show_ram_usage
        ;;
    vram)
        show_vram_usage
        ;;
    help|-h|--help)
        show_help
        ;;
    *)
        echo "Invalid option. Use 'cpu', 'ram', 'vram', or 'help'."
        echo ""
        show_help
        exit 1
        ;;
esac