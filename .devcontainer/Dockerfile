FROM mcr.microsoft.com/devcontainers/cpp:ubuntu-24.04


# include mpi+python3+pip3
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    openmpi-bin libopenmpi-dev python3 python3-pip python3-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install apptainer
# $ sudo apt update
# $ sudo apt install -y software-properties-common
# $ sudo add-apt-repository -y ppa:apptainer/ppa
# $ sudo apt update
# $ sudo apt install -y apptainer
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    software-properties-common \
    && add-apt-repository -y ppa:apptainer/ppa \
    && apt-get update \
    && apt-get -y install --no-install-recommends \
    apptainer \
    && apt-get clean && rm -rf /var/lib/apt/lists/*