FROM ubuntu:17.10

# configure apt to not install reccomendations
ENV DEBIAN_FRONTEND noninteractive

# install eatmydata to speed up the installation process
RUN apt-get update \
 && apt-get install -y eatmydata

# install latex
RUN eatmydata apt-get -y install texlive git

# check out source code
RUN mkdir -pv /src && cd /src && git clone https://github.com/mghansen256/linkToId

# re-create the style file and the documentation
# TODO: use a different output directory?
# TODO: put halt-on-error options here
RUN cd /src/linkToId && rm -f linkToId.sty && latex linkToId.ins && pdflatex linkToId.dtx

CMD bash
