all: shortbread_mapnik

CARTO=/usr/local/bin/carto
TILEDIR=vectortiles

shortbread_mapnik:
	$(MAKE) STYLE=$@ $@_z0.xml $@_z1.xml $@_z2.xml $@_z3.xml $@_z4.xml $@_z5.xml $@_z6.xml $@_z7.xml $@_z8.xml $@_z9.xml $@_z10.xml $@_z11.xml $@_z12.xml $@_z13.xml $@_z14.xml

%.xml: %.mml style/*.mss
	$(eval TEMPFILE=$(shell mktemp tmp.$@.XXXXXX))
	$(CARTO) $^ > $(TEMPFILE)
	mv $(TEMPFILE) $@

$(STYLE)_z%.mml: $(STYLE).mml
	./prepare_mml.py -z $* -p $(TILEDIR) -s vector $< > $@

clean:
	-rm -f shortbread_mapnik_z*.xml
	-rm -f tmp.shortbread_mapnik_z*.xml*
