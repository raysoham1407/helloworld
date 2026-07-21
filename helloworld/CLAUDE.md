# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a DevOps project repository that appears to be initialized but currently contains only this CLAUDE.md file and no actual source code. The repository is connected to https://github.com/raysoham1407/helloworld.git.

## Repository Structure

The repository follows a standard Git structure with:
- Main branch (default)
- Feature branches
- No existing source code files yet

## Development Setup

Since this is an empty repository, the following commands are relevant for initializing and developing:

### Initial Setup
```bash
# Clone the repository
git clone https://github.com/raysoham1407/helloworld.git

# Create a new feature branch
git checkout -b feature/<your-feature-name>
```

### Development Workflow
```bash
# Add files to staging
git add .

# Commit changes
git commit -m "Add descriptive commit message"

# Push to remote
git push origin feature/<your-feature-name>

# Create pull request (via GitHub UI)
```

## Common Development Tasks

### Git Operations
- Creating feature branches: `git checkout -b feature/branch-name`
- Switching between branches: `git checkout branch-name`
- Merging changes: `git merge branch-name`
- Checking status: `git status`

### Code Quality and Testing
Since no code exists yet, these commands will be relevant once development begins:
```bash
# For linting (when applicable)
npm run lint

# For testing (when applicable)  
npm test

# Running specific tests
npm test -- --testNamePattern="test-name"
```

## Project-Specific Notes

This repository is currently empty and appears to be the starting point for a DevOps project. As development progresses, it's expected that:
- Source code files will be added
- Build scripts will be implemented
- CI/CD pipelines will be configured
- Documentation will be expanded

The repository is set up to work with standard Git operations and follows typical branching conventions.

## New Script Added

A new monitoring script `system-monitor.sh` has been added that provides two options:
1. Show top processes using most CPU: `./system-monitor.sh cpu`
2. Show top processes using most VRAM (GPU memory): `./system-monitor.sh vram`

The script requires NVIDIA drivers and nvidia-smi to be installed for VRAM monitoring functionality.