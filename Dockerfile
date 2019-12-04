FROM fedora

# Install General Utilities
RUN dnf -y install procps iproute findutils

# Install General Development Tools
RUN dnf -y install git vim gdb lldb valgrind strace

# Install C Development Environment
RUN dnf -y install gcc clang make

# Install Rust Development Environment
RUN dnf -y install cargo clippy rustfmt rls rust-src rust-gdb rust-lldb rust-doc

# Install Build Dependencies
RUN dnf -y install glibc-static clang-devel llvm-devel openssl-devel

# Update Packages
# NOTE: Always keep this as the last step to ensure up-to-date packages.
RUN dnf -y update
