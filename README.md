# pyramid-prep-for-book
A personal repository for preparing SJGames Pyramid magazines for low cost home printing and binding.

## Using this project
By default, the project attempts to build a pdf with 'all' the Pyramid pdfs found in `build/` into a single pdf, without full page ads. To make the pdf, just type:

    make

NOTE: as of writing this, only the following Pyramid pdfs are supported (of the form #3/X): 36, 50, 60, 72, 76, 77, 89, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109 and 110. Pull requests to support more are welcome!

## How it works
There are three main files:
  * **main.tex** contains main formatting using the memoir class. This should not generally be changed
  * **pyramids.tex** contains supported Pyramid pdfs with page numbers
  * **pagespec.tex** contains information on the stock and trimmed page (see [memoir class manual](https://ctan.org/pkg/memoir?lang=en) for details)

### main.tex

This is a simple-ish file that imports a few sty files. If you want to change the look or feel of the project, this is the file to look at.

### pyramids.tex
This file contains lines with the following macro

```latex
%             location of pdf             | issue no | issue name | page spec
\pyramidissue{build/Pyramid_3_110_Deep_Space.pdf}{110}{Deep Space}{2-23,25-33,35-37}
```

If the pdf is not present at `location of pdf` then it will silently ignore it. Pull requests adding support for more issues are very welcome!

### pagespec.tex
This specifies the page specifications. By default, it supports a4 going down to a5. The stock page size is a4, with the trimmed size lower than my personal print margins but with a (long side)/(short side) ratio the same as an issue of Pyramid.

See [memoir class documentation](https://ctan.org/pkg/memoir?lang=en) for more details.
