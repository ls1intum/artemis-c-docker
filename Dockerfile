FROM fedora:35
# Make sure all sources are up to date
RUN dnf update -y && \
    dnf install -y \
        python3 python3-pip python3-devel \
        gcc clang git gdb make libasan libubsan liblsan libtsan \
        findutils bzip2 e2fsprogs \
        --nodocs --setopt install_weak_deps=False && \
    dnf clean all -y
# Add the artemis_user
COPY add_user.sh .
RUN bash /add_user.sh
# Give the artemis_user sudo rights without a password by default
RUN echo "artemis_user     ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers
# Change the user to the default Artemis user (away from root)
USER artemis_user
