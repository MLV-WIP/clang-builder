# clang-builder

A lightweight Docker container for building C/C++ projects with Clang 19, CMake, and testing frameworks.

## Features

- **Base Image**: Debian bookworm-slim (minimal footprint)
- **Compiler**: Clang 19 with C++ support
- **Build Tools**: GNU Make, CMake
- **Testing**: Google Test (gtest) and Google Mock (gmock)
- **Sanitizers**: LLVM sanitizers for detecting memory, thread, and undefined behavior issues
- **Utilities**: Git, curl, wget, pkg-config

## Quick Start

### Pull the Image

```bash
docker pull ghcr.io/MLV-WIP/clang-builder:latest
```

### Run the Container

```bash
docker run -it --rm -v $(pwd):/workspace ghcr.io/MLV-WIP/clang-builder:latest
```

### Build a C++ Project

```bash
docker run --rm -v $(pwd):/workspace ghcr.io/MLV-WIP/clang-builder:latest bash -c "cd /workspace && cmake -B build && cmake --build build"
```

## Included Tools and Versions

- **Clang**: 19.x
- **CMake**: Latest from bookworm-slim
- **Google Test**: Latest from debian packages
- **Google Mock**: Latest from debian packages
- **GNU Make**: Latest from bookworm-slim
- **Git**: Latest from bookworm-slim

## Environment

- **Working Directory**: `/workspace`
- **Default Shell**: bash

## Building Locally

```bash
docker build -t clang-builder:latest .
```

## GitHub Actions Automation

This repository includes GitHub Actions workflow that automatically:

1. Builds the Docker image when you push a git tag (format: `v*.*.*`)
2. Pushes the built image to GitHub Container Registry (ghcr.io)
3. Tags images with semantic versioning

### Triggering a Build

To trigger a build and push, create and push a release tag:

```bash
git tag v1.0.0
git push origin v1.0.0
```

The image will be available at:
- `ghcr.io/MLV-WIP/clang-builder:v1.0.0`
- `ghcr.io/MLV-WIP/clang-builder:1.0` (major.minor)
- `ghcr.io/MLV-WIP/clang-builder:1` (major version)
- `ghcr.io/MLV-WIP/clang-builder:latest` (latest tag)

## GitHub Container Registry Access

The workflow uses your GitHub token for authentication, so no additional secrets need to be configured. The container will be public if your repository is public.

### First Time Setup

1. GitHub username is set to `MLV-WIP` in all commands above
2. Ensure your GitHub repository is public (or set package visibility to public in repository settings)

## License

Add your preferred license here.

## Contributing

Contributions welcome! Please submit pull requests to improve the builder container.
