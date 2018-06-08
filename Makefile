PYRAMID_PDFS = $(wildcard pyramids/*.pdf)
BUILD_PDFS = $(patsubst pyramids/%,build/%,$(PYRAMID_PDFS))

.PHONY: all clean filterbitmaps
.PRECIOUS: main.pdf

all: main-pdfjam.pdf

%-pdfjam.pdf: %.pdf
	pdfjam --signature 16 --landscape --a4paper $<

%.pdf: %.tex
	latexmk -lualatex $<

clean:
	latexmk -CA
	rm -f *-pdfjam.pdf


filterbitmaps: $(BUILD_PDFS)

build/%.pdf: pyramids/%.pdf
	gs -o $@ -sDEVICE=pdfwrite -dFILTERIMAGE $<
