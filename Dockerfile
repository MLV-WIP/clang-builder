FROM ubuntu:26.04

# Set labels for container metadata
LABEL maintainer="Michael VanLoon <michaelv9876@gmail.com>"
LABEL description="Lightweight C/C++ builder container with clang-22, cmake, and testing frameworks"

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Core build tools
    build-essential \
    clang-22 \
    clang++-22 \
    libstdc++-16-dev \
    make \
    cmake \
    \
    # Testing frameworks
    libgtest-dev \
    libgmock-dev \
    \
    # LLVM sanitizers (ASan, TSan, UBSan, etc.)
    libclang-rt-22-dev \
    \
    # Additional utilities
    git \
    curl \
    wget \
    pkg-config \
    ca-certificates \
    \
    # Cleanup
    && rm -rf /var/lib/apt/lists/*

# Create symlinks for default clang/clang++ versions
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-22 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-22 100 && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100

# Set working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]
