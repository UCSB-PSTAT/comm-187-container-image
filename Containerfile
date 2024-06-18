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
    conda-forge::r-here \
    conda-forge::r-jtools \
    conda-forge::r-psych \
    conda-forge::r-tidyr && \
    mamba clean --all

# ltm is on Conda's website, but mamba can't find it, so install via R. 
RUN R -e "install.packages(c('ltm'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

USER $NB_USER
