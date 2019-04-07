# Dockerfile for testing linkToId on Ubuntu 17.10
FROM ubuntu:17.10

# configure apt to not install reccomendations
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
 
# first configure apt-get to use apt-cacher-ng if running on the host
# add --build-arg USEAPTCACHER=no to suppress looking for apt-cacher-ng
ARG USEAPTCACHER=yes
COPY tests/install-apt-cacher-ng-detector.sh /usr/local/bin
RUN chmod +x /usr/local/bin/install-apt-cacher-ng-detector.sh
RUN /usr/local/bin/install-apt-cacher-ng-detector.sh $USEAPTCACHER

# install eatmydata to speed up the installation process
RUN apt-get install -y eatmydata

# install latex
RUN eatmydata apt-get -y install texlive texlive-latex-extra texlive-luatex git lyx

# Import the repository into the image
# Requires start of the docker command from the root of the repository!
# docker build -t qhanoi -f docker/ubuntu17.10/Dockerfile .
RUN mkdir -pv /src/linkToId
ADD . /src/linkToId

# re-create the style file and the documentation
# TODO: use a different output directory?
# add --build-arg DOBUILD=no to avoid building
# Note: default shell in docker is "sh", not "bash". In "sh", the comparison
#       done with "=" instead of "=="!
ARG DOBUILD=yes
RUN if [ "$DOBUILD" = "yes" ] ; then \
        cd /src/linkToId \
     && rm -f linkToId.sty \
     && latex -interaction=nonstopmode -halt-on-error linkToId.ins \
     && pdflatex -interaction=nonstopmode -halt-on-error linkToId.dtx \
     && pdflatex -interaction=nonstopmode -halt-on-error linkToId.dtx  \
    ; fi

# compile the test document once to DVI and once to PDF
ARG RUNTESTS=yes
RUN if [ "$RUNTESTS" = "yes" ] ; then \
        cd /src/linkToId \
     && latex -interaction=nonstopmode -halt-on-error test-orcid.tex \
     && pdflatex -interaction=nonstopmode -halt-on-error test-orcid.tex \
     && lualatex -interaction=nonstopmode -halt-on-error test-orcid.tex \
    ; fi

# use LyX to export the LyX demonstration document to PDF via internal pdflatex conversion and
# lualatex PDf conversion (-E pdf5)
# Note that this does not show latex errors on the console output.
RUN if [ "$RUNTESTS" = "yes" ] ; then \
        cd /src/linkToId/lyx \
     && lyx -E pdf lyx-linkToId-1.pdf lyx-linkToId-1.lyx \
     && lyx -E pdf5 lyx-linkToId-1.pdf lyx-linkToId-1.lyx \
    ; fi

CMD bash
