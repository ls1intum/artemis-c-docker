# Base on Fedora 34
FROM fedora:34
# Make sure all sources are up to date
RUN dnf update -y
# Install python dependecies
RUN dnf install -y python3 python3-pip python3-devel
# Install all C dependencies
RUN dnf install -y gcc clang git gcc gdb make libasan libubsan liblsan libtsan
# Install other dependencies
RUN dnf install -y findutils bzip2 e2fsprogs
# Add the artemis_user
COPY add_user.sh .
RUN bash /add_user.sh
# Give the artemis_user sudo rights without a password by default
RUN echo "artemis_user     ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers
# Change the user to the default Artemis user (away from root)
USER artemis_user