FROM ucsb/rstudio-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN apt update -qq && \
    apt install -y \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic && \
    apt-get clean

#RUN mamba install -y astropy <libraries>

RUN pip install otter-grader nltk

USER $NB_USER
