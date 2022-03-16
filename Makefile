all: color

CARTO=/usr/local/bin/carto
#CARTO=./node_modules/.bin/carto
TILEDIR=vectortiles


color:
	$(MAKE) STYLE=$@ gf_basic_$@_z0.xml gf_basic_$@_z1.xml gf_basic_$@_z2.xml gf_basic_$@_z3.xml gf_basic_$@_z4.xml gf_basic_$@_z5.xml gf_basic_$@_z6.xml gf_basic_$@_z7.xml gf_basic_$@_z8.xml gf_basic_$@_z9.xml gf_basic_$@_z10.xml gf_basic_$@_z11.xml gf_basic_$@_z12.xml gf_basic_$@_z13.xml gf_basic_$@_z14.xml

%.xml: %.mml style/*.mss
	$(eval TEMPFILE=$(shell mktemp tmp.$@.XXXXXX))
	$(CARTO) $^ > $(TEMPFILE)
	mv $(TEMPFILE) $@

gf_basic_$(STYLE)_z%.mml: gf_basic_$(STYLE).mml
	./style_for_rendering_with_ogr_mvt.py -z $* $< $(TILEDIR) > $@

clean:
	-rm -f gf_basic_*_z*.xml
	-rm -f tmp.gf_basic_*_z*.xml*
