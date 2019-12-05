FROM fedora

# Install General Utilities
RUN dnf -y install procps iproute findutils

# Install General Development Tools
RUN dnf -y install git vim gdb lldb valgrind strace

# Install C Development Environment
RUN dnf -y install gcc clang make

# Install Build Dependencies
RUN dnf -y install glibc-static clang-devel llvm-devel openssl-devel

# Update Packages
# NOTE: Always keep this as the last step to ensure up-to-date packages.
RUN dnf -y update

# Install Rust Development Environment
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN . $HOME/.cargo/env && rustup component add rls rust-src
RUN . $HOME/.cargo/env && rustup default beta
RUN . $HOME/.cargo/env && rustup component add rls rust-src
RUN . $HOME/.cargo/env && rustup default nightly
#RUN . $HOME/.cargo/env && rustup component add rls rust-src
