#! /usr/bin/env python3

import argparse
import copy
import json
import os.path
import sys
import yaml


def get_layer_from_list_by_id(layer_list, name):
    for l in layer_list:
        if l["id"] == name:
            return l
    return {}


def get_datasource(source, vectortile_directory, layer_data, source_layer, dbname, user):
    if source.lower() == "vector":
        return {
            "file": "{}".format(tile_dir),
            "type": "ogr",
            "layer": source_layer
        }
    if source.lower() == "postgis":
        table = layer_data.get("sql_query", source_layer)
        result = {
            "file": "{}".format(tile_dir),
            "type": "postgis",
            "dbname": dbname,
            "geometry_field": "geom",
            "key_field": "",
            "extent": "-20037508,-20037508,20037508,20037508",
            "table": table,
        }
        if user:
            result["user"] = user
        return result


def modify_layer(layer_data, source, tile_dir, database, user, special_source_layer=None):
    source_layer_name = layer_data.get("Datasource", {}).get("layer", layer_data["id"])
    if special_source_layer is not None:
        source_layer_name = special_source_layer["name"]
    datasource = get_datasource(source, tile_dir, layer_data, source_layer_name, database, user)
    result_layer = {
        "id": layer_data["id"],
        "geometry": layer_data["geometry"],
        "properties": copy.deepcopy(layer_data["properties"]),
        "Datasource": datasource,
        "srs-name": "900913",
        "extent": "-20037508,-20037508,20037508,20037508",
        "srs": "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over",
    }
    if type(special_source_layer) is dict:
        for key in ["minzoom", "maxzoom"]:
            if key in special_source_layer:
                result_layer["properties"][key] = special_source_layer[key]
    return result_layer


def layer_in_zoom_range(layer_minzoom, layer_maxzoom, target_zoom):
    # Largest zoom level vector tiles are produced for. This zoom level and all larger zoom levels use the same Mapnik style file.
    max_vectortile_zoom = 14
    if target_zoom < max_vectortile_zoom:
        return layer_minzoom <= target_zoom and target_zoom <= layer_maxzoom
    return max_vectortile_zoom <= layer_maxzoom


parser = argparse.ArgumentParser(description="Convert .mml file to be used for rendering with Mapnik's OGR input plugin and OGR's MVT driver. Result is written to standard output in YAML format")
parser.add_argument("-d", "--database", type=str, default="gis", help="Database name")
parser.add_argument("-p", "--path-to-zoom", type=str, help="Path to directory vectortile directory. Required for --source=vector.")
parser.add_argument("-s", "--source", type=str, default="vector", help="Data source (vector, postgis)")
parser.add_argument("-U", "--user", type=str, default=None, help="Database user")
parser.add_argument("-z", "--zoom", type=int, help="Zoom level. Required for vector source.")
parser.add_argument("input_file", type=argparse.FileType("r"), help="input .mml file")
args = parser.parse_args()

if args.source == "vector" and (args.path_to_zoom is None or args.zoom is None):
    sys.stderr.write("ERROR: --path-to-zoom or --zoom are missing but source is set to vector.\n")
    exit(1)

# Read input file
input_yaml = yaml.safe_load(args.input_file)
layers = input_yaml.get("Layer", [])

tile_dir = None
if args.source == "vector":
    tile_dir = os.path.join(args.path_to_zoom, str(args.zoom))

result_layers = []
for i in range(len(layers)):
    layer_from = layers[i]
    if args.source == "vector":
        lz1 = int(layer_from.get("properties", {}).get("minzoom", 0))
        lz2 = int(layer_from.get("properties", {}).get("maxzoom", 24))
        if not layer_in_zoom_range(lz1, lz2, args.zoom):
            continue
    if args.source == "postgis" and len(layer_from.get("osm2pgsql_source_layers", [])) > 0:
        for source_index in range(len(layer_from.get("osm2pgsql_source_layers", []))):
            source_layer = layer_from["osm2pgsql_source_layers"][source_index]
            result_layers.append(modify_layer(layer_from, args.source, tile_dir, args.database, args.user, source_layer))
    else:
        result_layers.append(modify_layer(layer_from, args.source, tile_dir, args.database, args.user))

input_yaml["Layer"] = result_layers

sys.stdout.write(yaml.dump(input_yaml, default_flow_style=False, width=100))
