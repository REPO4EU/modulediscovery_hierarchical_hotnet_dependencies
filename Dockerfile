FROM mambaorg/micromamba:debian12-slim

USER root
RUN apt-get update && \
    apt-get install -y git procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY  environment.yml ./
RUN micromamba install -y -n base -f ./environment.yml && \
    micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN git clone https://github.com/raphael-group/hierarchical-hotnet.git /hierarchical-hotnet
WORKDIR /hierarchical-hotnet
ENV PATH="${PATH}:${MAMBA_ROOT_PREFIX}/bin"
