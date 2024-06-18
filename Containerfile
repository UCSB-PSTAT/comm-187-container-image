FROM ucsb/rstudio-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN apt update -qq && \
    apt install -y \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic && \
    apt-get clean

RUN mamba install -y \
    conda-forge::scipy \
    conda-forge::otter-grader \
    conda-forge::nltk \
    conda-forge::r-tidyr


USER $NB_USER
