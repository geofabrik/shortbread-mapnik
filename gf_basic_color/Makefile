THISDIR=$(shell pwd)
CARTO=carto
TILEDIR=vectortiles

XMLFILES=$(shell for ZOOM in `seq 0 14`; do echo -n "project_z$${ZOOM}.xml "; done)
MMLFILES=$(shell for ZOOM in `seq 0 14`; do echo -n "project_z$${ZOOM}.mml "; done)

all: $(XMLFILES)

clean: $(XMLFILES) $(MMLFILES)
	rm -f $^

project_%.xml: project_%.mml
	$(CARTO) $^ > $@

project_z0.mml: project.mml metadata.json
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 0 $< $(TILEDIR) > $@

project_z1.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 1 $< $(TILEDIR) > $@

project_z2.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 2 $< $(TILEDIR) > $@

project_z3.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 3 $< $(TILEDIR) > $@

project_z4.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 4 $< $(TILEDIR) > $@

project_z5.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 5 $< $(TILEDIR) > $@

project_z6.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 6 $< $(TILEDIR) > $@

project_z7.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 7 $< $(TILEDIR) > $@

project_z8.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 8 $< $(TILEDIR) > $@

project_z9.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 9 $< $(TILEDIR) > $@

project_z10.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 10 $< $(TILEDIR) > $@

project_z11.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 11 $< $(TILEDIR) > $@

project_z12.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 12 $< $(TILEDIR) > $@

project_z13.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 13 $< $(TILEDIR) > $@

project_z14.mml: project.mml 
	$(THISDIR)/../style_for_rendering_with_ogr_mvt.py -z 14 $< $(TILEDIR) > $@
