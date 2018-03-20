FROM continuumio/miniconda3:latest

LABEL maintainer "Yang Bo <atryyang@thoughtworks.com>"

RUN ln -sf /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh

RUN conda install -y -c conda-forge pocl || conda install -y -c conda-forge pocl

RUN apt-get update && apt-get install -y --no-install-recommends \
        ocl-icd-opencl-dev \
        ocl-icd-libopencl1 \
        clinfo && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "/opt/conda/lib64/libpocl.so.2" > /etc/OpenCL/vendors/conda-pocl.icd
