THISDIR=$(shell pwd)

all: color

color: Makefile_color
	make -f $<

Makefile_color:
	$(THISDIR)/build_makefile.sh color

