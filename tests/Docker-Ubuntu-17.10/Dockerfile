# Dockerfile for testing linkToId on Ubuntu 17.10

FROM ubuntu:17.10

# configure apt to not install reccomendations
ENV DEBIAN_FRONTEND noninteractive

# install eatmydata to speed up the installation process
RUN apt-get update \
 && apt-get install -y eatmydata

# install latex
RUN eatmydata apt-get -y install texlive texlive-latex-extra git

# check out source code
RUN mkdir -pv /src && cd /src && git clone https://github.com/mghansen256/linkToId

# re-create the style file and the documentation
# TODO: use a different output directory?
RUN cd /src/linkToId \
 && rm -f linkToId.sty \
 && latex -interaction=nonstopmode -halt-on-error linkToId.ins \
 && pdflatex -interaction=nonstopmode -halt-on-error linkToId.dtx

# compile the test document once to DVI and once to PDF
RUN cd /src/linkToId \
 && latex -interaction=nonstopmode -halt-on-error test-orcid.tex \
 && pdflatex -interaction=nonstopmode -halt-on-error test-orcid.tex

CMD bash
