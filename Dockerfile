FROM fedora:35
# Make sure all sources are up to date
RUN dnf update -y && \
    dnf install -y \
        python3 python3-pip python3-devel \
        gcc clang git gdb make libasan libubsan liblsan libtsan \
        findutils bzip2 e2fsprogs \
        --nodocs --setopt install_weak_deps=False && \
    dnf clean all -y
# UserID 5000 required for Artemis Build Infrastructure
RUN useradd --uid 5000 artemis_user
# Give the artemis_user sudo rights without a password by default
RUN echo "artemis_user     ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers
# Change the user to the default Artemis user (away from root)
USER artemis_user
