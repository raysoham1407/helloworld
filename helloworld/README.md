# HelloWorld DevOps Project

This repository contains a DevOps project with monitoring scripts for system resource usage.

## Available Scripts

### `system-monitor.sh`

A bash script that provides two monitoring options:

1. **CPU Usage Monitoring**: Shows top processes using most CPU
   ```bash
   ./system-monitor.sh cpu
   ```

2. **VRAM Usage Monitoring**: Shows top processes using most VRAM (GPU memory)
   ```bash
   ./system-monitor.sh vram
   ```

## Requirements

- Linux system with bash shell
- For VRAM monitoring: NVIDIA GPU with drivers and nvidia-smi installed

## Usage Examples

```bash
# Show CPU usage
./system-monitor.sh cpu

# Show VRAM usage  
./system-monitor.sh vram

# Show help
./system-monitor.sh help
```

## Repository Structure

- `system-monitor.sh` - Main monitoring script
- `CLAUDE.md` - Development guidelines for Claude Code