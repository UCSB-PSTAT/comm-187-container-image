FROM ucsb/rstudio-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN apt update -qq && \
    apt install -y \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic && \
    apt-get clean

RUN conda install -y \
    scipy \
    otter-grader \
    nltk \
    r-here \
    r-jtools \
    r-psych \
    r-tidyr && \
    conda clean --all

# ltm is on Conda's website, but mamba can't find it, so install via R. 
RUN R -e "install.packages(c('ltm'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

USER $NB_USER
