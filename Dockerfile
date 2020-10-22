# Base on Fedora 32
FROM fedora:32
# Make sure all sources are up to date
RUN dnf update -y
# Install python dependecies
RUN dnf install -y python3 python3-pip python3-devel
# Install all C dependencies
RUN dnf install -y gcc clang git gcc gdb make libasan libubsan liblsan libtsan
