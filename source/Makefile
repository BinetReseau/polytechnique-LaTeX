.PHONY: package install clean cleandist

PDFLATEX:=pdflatex -interaction=nonstopmode
PKGDIR:=$(shell kpsewhich --show-path=ls-R | tr : '\n' | grep texmf | grep local | head -n1)
POLYPKGDIR:=$(PKGDIR)/tex/latex/polytechnique

all: package

package: polytechnique.sty

%.sty: %.dtx
	$(PDFLATEX) $*.dtx

install: package clean
	mkdir -p $(POLYPKGDIR)
	cp -r . $(POLYPKGDIR)

clean:
	rm -f polytechnique.aux polytechnique.glo polytechnique.idx polytechnique.log polytechnique.out polytechnique.toc

cleandist: clean
	rm -f polytechnique.pdf polytechnique.sty
