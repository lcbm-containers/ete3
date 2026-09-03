FROM mambaorg/micromamba@sha256:fc840b7c6c857bec8aa0db9b29a3963bb7d0395ea6a1062686b8c65c1a457870

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends procps seqtk && \
    rm -rf /var/lib/apt/lists/*

RUN micromamba install -y \
    -c conda-forge \
    -c bioconda \
    -c etetoolkit \
    python=3.11 \
    ete3=3.1.3 && \
    micromamba clean -afy

WORKDIR /workdir

CMD ["/bin/bash"]
