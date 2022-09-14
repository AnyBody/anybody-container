#syntax=docker/dockerfile:1.4

ARG ANYBODY_VERSION=7.4.2
ARG ANYBODY_FOLDER=AnyBody.7.4
ARG BASE_IMAGE="ghcr.io/anybody/anybodycon-linux-minimal"
ARG TAG=7.4.2-0

FROM ghcr.io/anybody/container-build-store:${ANYBODY_VERSION} as anybody-build-store


FROM ${BASE_IMAGE}:${TAG}
LABEL org.opencontainers.image.source https://github.com/anybody/anybody-container
ARG ANYBODY_VERSION
ARG ANYBODY_FOLDER

COPY --from=anybody-build-store --link --chown=${MAMBA_USER} ["extra" ,  "/wine/drive_c/Program Files/AnyBody Technology/${ANYBODY_FOLDER}/"]

#USER root

# Remove _pth file to allow overwriting PYTHON environment variables etc. 
RUN rm /wine/drive_c/Program\ Files/AnyBody\ Technology/${ANYBODY_FOLDER}/Python/python37._pth 

ARG AMS_MKL_DIR=/wine/drive_c/Program\ Files/AnyBody\ Technology/${ANYBODY_FOLDER}/AnyBody.MKL-2019.1.144-x64
ARG AMS_PYTHON_MKL_DIR=/wine/drive_c/Program\ Files/AnyBody\ Technology/${ANYBODY_FOLDER}/Python/Library/bin
# The following files are excluded in .dockeringore and we link to 
# the AnyBody copies to save image size.
RUN ln "${AMS_MKL_DIR}/mkl_avx2.dll"  "${AMS_PYTHON_MKL_DIR}/mkl_avx2.dll" \
   && ln "${AMS_MKL_DIR}/mkl_avx512.dll"  "${AMS_PYTHON_MKL_DIR}/mkl_avx512.dll" \
   && ln "${AMS_MKL_DIR}/mkl_core.dll"  "${AMS_PYTHON_MKL_DIR}/mkl_core.dll" \
   && ln "${AMS_MKL_DIR}/mkl_intel_thread.dll"  "${AMS_PYTHON_MKL_DIR}/mkl_intel_thread.dll"


USER $MAMBA_USER


RUN micromamba install --yes --name base --channel conda-forge --channel bioconda \
      nomkl  \
      snakemake-minimal \
      pandas  \
      pytest  \
      pytest-xdist  \
      anypytools && \
    micromamba clean --all --yes



ENV PYTHONHASHSEED=1234

ENV WINEPATH=C:\\Program\ Files\\AnyBody\ Technology\\${ANYBODY_FOLDER}\\Python;C:\\Program\ Files\\AnyBody\ Technology\\${ANYBODY_FOLDER}\\Python\\Library\\mingw-w64\\bin;C:\\Program\ Files\\AnyBody\ Technology\\${ANYBODY_FOLDER}\\Python\\Library\\usr\\bin;C:\\Program\ Files\\AnyBody\ Technology\\${ANYBODY_FOLDER}\\Python\\Library\\bin;C:\\Program\ Files\\AnyBody\ Technology\\${ANYBODY_FOLDER}\\Python\\Scripts;C:\\Program\ Files\\AnyBody\ Technology\\${ANYBODY_FOLDER}\\Python\\bin;c:\\windows\\system32;c:\\windows;c:\\windows\\system32\\wbem
ENV SystemRoot=c:\\windows
ENV SystemDrive=c:

# WORKDIR $HOME


