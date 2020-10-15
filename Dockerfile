# Base on Ubuntu 19.10
FROM ubuntu:19.10
# Make sure all sources are up to date
RUN apt-get update
# Install python dependecies
RUN apt install -y python3 python3-pip
# Install all C dependencies
RUN apt install -y gcc-8 gdb make libasan5 libubsan0 liblsan0 libtsan0
# Install pytest for python exercises
RUN pip3 install -U pytest
