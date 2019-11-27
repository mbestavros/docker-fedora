FROM fedora

RUN dnf -y update
RUN dnf -y install gcc clang-devel llvm-devel cargo clippy rustfmt rls
