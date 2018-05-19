How to release a linkToId version
=================================

 1. Set the version number and the release date in the line containing `\ProvidesPackage` at the top of *linkToId.dtx*
 2. Describe changes in the new version in a new `\changes` entry near the existing entries in *linkToId.dtx*
 3. Re-create the .sty file:  
    `pdflatex linkToId.ins`
 3. Create the PDF documentation for linkToId by running `makedoc-luatex.sh` and check the resulting document.
 4. Write down the checksum of the .dtx file for later.
 5. Commit all changes made above, but do not add the *linkToId.pdf* document.
 6. Push master to github: `git push github master`
 7. Create and checkout a branch for the new version:
    `git checkout -b releases/linkToId-v0.2`
 8. Update the number given to the `\checksum` command in *linkToId.dtx* to the checksum you saw earlier.
 9. Re-create the documentation to verify that the checksum of *linkToId.dtx* is correct.
 10. Add linkToId.pdf and commit it together with the changes to *linkToId.dtx*.
 11. Tag the release:  
     `git tag v0.2 -m "Release version 0.2"`
 12. Push branch and tag to github:  
     `git push github releases/v0.2`  
     `git push github v0.2`

I know that putting binary files into git is not regarded good practice, but at the current size of the project, it makes it easier to make releases via github.

