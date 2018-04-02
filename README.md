LaTeX package to create links to ID services such as ORCID
==========================================================

This LaTeX package provides a style file to create links to ID services for researchers.
Currently, only [ORCID(R)](https://orcid.org) is supported.

## Installation

### Installation alongside a document

Since this package is fairly new and not yet on CTAN, it is probably best to simply put the requires files into the folder where you have the .text-document which uses the package. For usage, the file "linkToId.sty" and the files with names beginning with "linkToId-" are required.

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



