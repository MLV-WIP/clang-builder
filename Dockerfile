FROM ubuntu:24.04

# Set labels for container metadata
LABEL maintainer="Michael VanLoon <michaelv9876@gmail.com>"
LABEL description="Lightweight C/C++ builder container with clang-20, cmake, and testing frameworks"

# Update package lists and install development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Core build tools
    build-essential \
    clang-20 \
    clang++-20 \
    make \
    cmake \
    \
    # Testing frameworks
    libgtest-dev \
    libgmock-dev \
    \
    # LLVM sanitizers
    libclang-rt-20-dev \
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
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-20 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-20 100 && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100

# Set working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]
