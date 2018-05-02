#!/bin/bash
# This file creates the linkToId.pdf documentation for the linkToId package.
#
# Copyright (C) 2018 by Michael G. Hansen
#
# This file may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either
# version 1.3 of this license or (at your option) any later
# version. The latest version of this license is in:
#
# http://www.latex-project.org/lppl.txt
#
# and version 1.3 or later is part of all distributions of
# LaTeX version 2005/12/01 or later.
#

# makeindex is run for making the version history using \version. gglo.ist is the style file for this operation. 
lualatex linkToId.dtx \
 && makeindex -o linkToId.gls -s gglo.ist linkToId.glo \
 && lualatex linkToId.dtx

# could make an index with this statement:
# && makeindex -o linkToId.ind -s gind.ist linkToId.idx \ #
