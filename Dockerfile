FROM fedora

# Set Rustup install location. Needed to install correctly on a container.
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

# Enable the musl repo (for musl libc)
RUN dnf -y install dnf-plugins-core
RUN dnf -y copr enable taocris/musl
RUN dnf -y install musl-devel musl-libc-static musl-gcc musl-clang

# Install General Utilities
RUN dnf -y install procps iproute findutils man file

# Install General Development Tools
RUN dnf -y install git git-subtree vim gdb lldb valgrind strace diffstat patch hub

# Install C Development Environment
RUN dnf -y install gcc clang make

# Install Build Dependencies
RUN dnf -y install glibc-static clang-devel llvm-devel openssl-devel

# Documentation
RUN dnf -y mscgen graphviz

# Install Rust via rustup.
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y -q

# Install the musl compilation target.
RUN rustup target add x86_64-unknown-linux-musl

# Install other Rust-related tools.
RUN rustup component add rustfmt

RUN cargo install --force cargo-audit

# NOTE: Always keep these as the last steps to ensure up-to-date packages.
# Update Packages
RUN dnf -y update

# Update rustup components
RUN rustup update

CMD /bin/bash
