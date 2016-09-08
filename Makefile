.PHONY:all %.all install %.install clean %.clean cleandist %.cleandist release

SUBMAKE:=make -s -C
SUBMAKABLE:=$(shell find -mindepth 2 -name '[Mm]akefile' | sed 's%^./%%;s%/[^/]*%%')
define submake
	@tput setaf 3
	@echo make[$1] $2
	@tput sgr0
	@$3 $(SUBMAKE) $1 $2
endef

all: $(patsubst %,%.all,$(SUBMAKABLE))

%.all:
	$(call submake,$*,,)

install: $(patsubst %,%.install,$(SUBMAKABLE))

%.install:
	$(call submake,$*,install,sudo)

clean: $(patsubst %,%.clean,$(SUBMAKABLE))

%.clean:
	$(call submake,$*,clean,)

cleandist: $(patsubst %,%.cleandist,$(SUBMAKABLE))

%.cleandist:
	$(call submake,$*,cleandist,)

release:
	$(call submake,.,,)
	$(call submake,.,clean,)
