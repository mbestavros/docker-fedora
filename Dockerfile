FROM fedora

# Install General Utilities
RUN dnf -y install procps iproute findutils man

# Install General Development Tools
RUN dnf -y install git git-subtree vim gdb lldb valgrind strace diffstat patch hub

# Install C Development Environment
RUN dnf -y install gcc clang make

# Install Build Dependencies
RUN dnf -y install glibc-static clang-devel llvm-devel openssl-devel

# Update Packages
# NOTE: Always keep this as the last step to ensure up-to-date packages.
RUN dnf -y update

CMD /bin/bash
