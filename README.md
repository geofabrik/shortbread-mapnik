# Shortbread-Mapnik – Vector Map Styles for Mapnik

## Installation

* Create vector tiles using the [Shortbread schema](https://github.com/geofabrik/shortbread-tilemaker).
* Convert the .mbtiles file returned by Tilemaker into plain z/x/y.pbf structure using [mbutil](https://github.com/mapbox/mbutil).
* Add geometry types to the `metadata.json` file of the vector tile tileset using the [add_geometry_types.py](https://github.com/geofabrik/shortbread-tilemaker/blob/main/add_geometry_types.py) script.
* Build map styles for zoom levels 0 to 14 using `cd shortbread-mapnik && make`.
  Some Makefile variables are used, There are sensible defaults.
    `CARTO`:: defined the the path to the `carto` binary. The default works if
       you ran `npm install -g carto`. Use `CARTO=./node_modules/.bin/carto`
	   if you ran `npm install carto` in the root of the project
	`TILEDIR`:: Path where MVTs are loaded from. Default is `vectortiles` in
	   the root of the project
  e.g. `make CARTO=/usr/local/bin/carto TILEDIR=/bigdisk/vtiles all`

## Technical Notes

The map style uses the OGR input plugin of Mapnik and [GDAL's MVT driver](https://gdal.org/drivers/vector/mvt.html) to use vector tiles as data source.
This leads to a few oddities compared to established Mapnik styles for raster tile rendering:

* Due to a bug/feature in OGR that needs sorting out, we currently need one map style per input zoom level, i.e. one XML file for zoom 0, one for zoom 1, … one for zoom 13 and one for zoom 14+. The Tirex queue manager has a [feature](https://github.com/openstreetmap/tirex/commit/7e7c3e76cea92527dffa74aca8386cf38fe6d71a) that allows one to present this collection of different styles as one map style to the outside again but in the long run OGR needs to be modified to not default to the highest available vector tile zoom level for any rendering request.
* The file parameter of the data source in the Mapnik style has to point to the directory of the zoom level. GDAL expects a `metadata.json` file the parent directory of the zoom level. That file specifies the layer and their geometry types. Without the information about the geometry, GDAL will do a sequential read on all vector tiles on that zoom level in order to detect the geometry type for each layer.
* Vector tiles have to contain the features in the order they should be rendered on the map because the OGR data source does not support sorting. 

## See also

* [Tilemaker](https://tilemaker.org/)
* [Tilemaker source code](https://github.com/systemed/tilemaker)
* [Shortbread schema for Tilemaker](https://github.com/geofabrik/shortbread-tilemaker)
* [Shortbread documentation](https://github.com/geofabrik/shortbread-docs)

## Authors

This set of configuration files has been created for Geofabrik by Christine Karch 
and Amanda McCann before it was put on Github. Further contributors may be visible 
in the Git history.

## License and Copyright

You are free to use this map style under the same license that applies to the 
tilemaker software, the [FTWPL license](./LICENCE.txt).
