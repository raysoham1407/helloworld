#!/bin/bash

# Script to monitor system processes by CPU and VRAM usage
# Usage: ./top-cpu-processes.sh [option]
# Options:
#   cpu    - Show top processes using most CPU
#   vram   - Show top processes using most VRAM (GPU memory)

show_cpu_usage() {
    echo "=== Top 5 Processes Using Most CPU ==="
    ps aux --sort=-%cpu | head -6 | awk 'NR>1 {printf "%-10s %-8s %6.2f%% %s\n", $1, $2, $3, $11}'
    echo ""
    echo "Column explanation:"
    echo "USER     PID      CPU%     COMMAND"
    echo ""
}

show_vram_usage() {
    echo "=== Top Processes Using Most VRAM ==="

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
    echo "Column explanation:"
    echo "PID      PROCESS NAME                          MEMORY (MB)   MEMORY (GB)"
    echo ""
}

show_help() {
    echo "Usage: $0 [option]"
    echo ""
    echo "Options:"
    echo "  cpu    - Show top processes using most CPU"
    echo "  vram   - Show top processes using most VRAM (GPU memory)"
    echo "  help   - Show this help message"
    echo ""
    echo "Example:"
    echo "  $0 cpu"
    echo "  $0 vram"
}

# Main script logic
case "$1" in
    cpu)
        show_cpu_usage
        ;;
    vram)
        show_vram_usage
        ;;
    help|-h|--help)
        show_help
        ;;
    *)
        echo "Invalid option. Use 'cpu', 'vram', or 'help'."
        echo ""
        show_help
        exit 1
        ;;
esac