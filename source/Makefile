.PHONY: package install clean cleandist

V:=1

ifeq ("$V","1")
define say
	@tput setaf 4
	@echo $1
	@tput sgr0
endef
else
define say
endef
endif

define installed
	@tput setaf 2
	@tput bold
	@echo "SUCCESS : installed in '"$1"'."
endef

PDFLATEX:=pdflatex -interaction=nonstopmode
MAKEINDEX:=makeindex -q -s gind.ist -o
OUTPUT:=>/dev/null 2>&1
PKGDIR:=$(shell kpsewhich --show-path=ls-R | tr : '\n' | grep texmf | grep local | head -n1)
POLYPKGDIR:=$(PKGDIR)/tex/latex/polytechnique
DTXFILES:=$(shell find -name '*.dtx')
GENFILES:=$(patsubst %.dtx,%.pdf,$(DTXFILES)) $(patsubst %.dtx,%.sty,$(DTXFILES))

all: package

package: polytechnique.sty

%.sty: %.dtx
	$(call say,creating package file $@)
	@$(PDFLATEX) $*.dtx $(OUTPUT)
	@$(MAKEINDEX) $*.ind $*.idx $(OUTPUT)
	@$(PDFLATEX) $*.dtx $(OUTPUT)

install: package clean
	$(call say,creating destination $(POLYPKGDIR))
	@mkdir -p $(POLYPKGDIR)
	$(call say,copying files to $(POLYPKGDIR))
	@cp -r . $(POLYPKGDIR)
	@rm -f $(POLYPKGDIR)/Makefile
	$(call installed,$(POLYPKGDIR))

clean:
	$(call say,cleaning files)
	@rm -f polytechnique.aux polytechnique.glo polytechnique.idx polytechnique.log polytechnique.out polytechnique.toc polytechnique.ind polytechnique.ilg

cleandist: clean
	$(call say,removing doc and package files)
	@rm -f $(GENFILES)
