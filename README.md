# HelloWorld DevOps Project

This repository contains DevOps tools and utilities including system monitoring and a web-based Markdown reader application.

## Available Scripts

### `system-monitor.sh`

A bash script that provides three monitoring options:

1. **CPU Usage Monitoring**: Shows top processes using most CPU
   ```bash
   ./system-monitor.sh cpu
   ```

2. **RAM Usage Monitoring**: Shows top processes using most RAM
   ```bash
   ./system-monitor.sh ram
   ```

3. **VRAM Usage Monitoring**: Shows top processes using most VRAM (GPU memory)
   ```bash
   ./system-monitor.sh vram
   ```

### `markdown_reader_web.html`

A web-based split-screen Markdown editor with live preview, built with HTML, CSS, and JavaScript.

#### Features

- Edit Markdown in the left panel
- Real-time preview in the right panel
- Formatting toolbar with Bold, Italic, Heading, Quote, Link, Code, List
- File operations: New, Open, Save
- Keyboard shortcuts (Ctrl+N/O/S)
- Responsive design that works on different screen sizes

#### Usage

Simply open `markdown_reader_web.html` in any modern web browser to use the editor.

## Requirements

- For system monitoring: Linux system with bash shell
- For VRAM monitoring: NVIDIA GPU with drivers and nvidia-smi installed
- Modern web browser for the Markdown reader

## Usage Examples

```bash
# Show CPU usage
./system-monitor.sh cpu

# Show RAM usage
./system-monitor.sh ram

# Show VRAM usage
./system-monitor.sh vram

# Show help
./system-monitor.sh help

# Open web-based Markdown reader in browser
xdg-open markdown_reader_web.html
```

## Repository Structure

- `system-monitor.sh` - System resource monitoring script
- `markdown_reader_web.html` - Web-based split-screen Markdown editor + preview
+ `markdown_reader_web_README.md` - Dedicated documentation for the web reader
- `README.md` - This file
- `DEVOPS_GUIDELINES.md` - DevOps development guidelines