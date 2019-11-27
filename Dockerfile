FROM fedora

RUN dnf -y update
RUN dnf -y install gcc clang-devel llvm-devel make openssl-devel
RUN dnf -y install cargo clippy rustfmt rls
