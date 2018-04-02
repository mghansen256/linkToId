linkToId for LaTeX [![Build Status](https://travis-ci.org/mghansen256/linkToId.svg?branch=master)](https://travis-ci.org/mghansen256/linkToId)
==================

This LaTeX package provides a style file to create links to ID services for researchers.
Currently, only [ORCID(R)](https://orcid.org) is supported.

## Installation

If you encounter problems during installation, please have a look at a Dockerfile in the tests/Docker-* subdirectories to see what might be wrong.

### Creation of the style file and the documentation

To (re-)generate the style file, run:

```
latex linkToId.ins
```

Then, to create the package documentation in a PDF file, run:

```
pdflatex linkToId.dtx
```


### Installation alongside a document

Since this package is fairly new and not yet on CTAN, it is probably best to simply put the whole package directory as a subdirectory into the folder where you have the .text-document which uses the package. Then, however, you have to tell linkToId about the sub-path manually:

```latex
% linkToId.sty is in the directory "linkToId-subdirectory"
\newcommand{\linkToIdRelativePath}{linkToId-subdirectory}
\usepackage{linkToId-subdirectory/linkToId}
```

## Usage

Tell LaTeX to use the package, then use the ID specific linking commands to create the links.

```latex
\usepackage{linkToId}
```

### ORCID

ORCID.org including to ORCID logo and using the recommended typesetting. Note that use of the ORCID icon should follow [ORCID's trademark and id display guidelines](https://orcid.org/trademark-and-id-display-guidelines).

Create links to ORCID using names and IDs:

- Name with an icon behind it:

```latex
\linkToOrcidNameIcon{Josiah Carberry}{https://orcid.org/0000-0002-1825-0097}
```

- Icon with ID behind it:

```latex
\linkToOrcidIconId{https://orcid.org/0000-0002-1825-0097}
```

- Name, icon and ID:

```latex
\linkToOrcidNameIconId{Josiah Carberry}{https://orcid.org/0000-0002-1825-0097}
```



