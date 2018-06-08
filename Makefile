.PHONY: all clean
.PRECIOUS: main.pdf

all: main-pdfjam.pdf

%-pdfjam.pdf: %.pdf
	pdfjam --signature 16 --landscape --a4paper $<

%.pdf: %.tex
	latexmk -lualatex $<

clean:
	latexmk -CA
	rm -f *-pdfjam.pdf
