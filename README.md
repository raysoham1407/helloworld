# HelloWorld DevOps Project

This repository contains DevOps tools and utilities including system monitoring and a web-based Markdown reader application. Both tools are designed to be self-contained and portable.

## Tools

### System Monitor Script (`system-monitor.sh`)
A bash script for monitoring system resources with three modes:
- CPU usage
- RAM usage  
- VRAM usage (requires NVIDIA GPU with drivers)

### Web-based Markdown Reader (`markdown_reader_web.html`)
A split-screen Markdown editor with real-time preview, built with HTML, CSS, and JavaScript - no server required.

## Documentation

Each tool has dedicated documentation:
- `SYSTEM_MONITOR_GUIDELINES.md` - Details on using the system monitor script
- `markdown_reader_web_README.md` - Complete documentation for the web-based Markdown reader

## Requirements

- Linux system with bash shell for system monitoring
- Modern web browser for the Markdown reader
- For VRAM monitoring: NVIDIA GPU with drivers and nvidia-smi installed

## Usage

### System Monitor
```bash
# Show CPU usage
./system-monitor.sh cpu

# Show RAM usage
./system-monitor.sh ram

# Show VRAM usage
./system-monitor.sh vram

# Show help
./system-monitor.sh help
```

### Markdown Reader
Simply open `markdown_reader_web.html` in any modern web browser to use the editor.

## Repository Structure

- `system-monitor.sh` - System resource monitoring script
- `markdown_reader_web.html` - Web-based split-screen Markdown editor + preview
+ `markdown_reader_web_README.md` - Dedicated documentation for the web reader
- `README.md` - This file
- `SYSTEM_MONITOR_GUIDELINES.md` - Documentation for the system monitor script