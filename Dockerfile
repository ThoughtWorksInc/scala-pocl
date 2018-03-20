FROM continuumio/miniconda3:latest

LABEL maintainer "Yang Bo <atryyang@thoughtworks.com>"

RUN conda install -y -c conda-forge pocl || conda install -y -c conda-forge pocl
