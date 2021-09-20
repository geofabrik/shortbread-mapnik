#! /usr/bin/env python3

"Convert .mml file to be used for rendering with Mapnik's OGR input plugin and OGR's MVT driver."

def get_layer_from_list_by_id(layer_list, name):
    for l in layer_list:
        if l["id"] == name:
            return l
    return {}


import argparse
import json
import os.path
import sys
import yaml

parser = argparse.ArgumentParser(description="Convert .mml file to be used for rendering with Mapnik's OGR input plugin and OGR's MVT driver. Result is written to standard output in YAML format")
parser.add_argument("-z", "--zoom", type=int, default=14, help="Zoom level")
parser.add_argument("input_file", type=argparse.FileType("r"), help="input .mml file")
parser.add_argument("path_to_zoom", type=str, help="Path to directory vectortile directory")
args = parser.parse_args()

# Read input file
input_yaml = yaml.safe_load(args.input_file)
layers = input_yaml.get("Layer", [])

# Vector layers
vector_layers = []

tile_dir = os.path.join(args.path_to_zoom, str(args.zoom))

result_layers = []
for i in range(len(layers)):
    layer_from = layers[i]
    if int(layer_from.get("properties", {}).get("minzoom", 0)) > args.zoom:
        continue
    if int(layer_from.get("properties", {}).get("maxzoom", 24)) < args.zoom:
        continue
    result_layer = {
        "id": layer_from["id"],
        "properties": layer_from["properties"],
        "Datasource": {
            "file": "{}".format(tile_dir),
            "type": "ogr",
            "layer": layer_from["id"]
        },
        "srs-name": "900913",
        "extent": "-20037508,-20037508,20037508,20037508",
        "srs": "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over",
    }
    if "geometry" in layer_from:
        geometry = layer_from["geometry"]
        if geometry == "line":
            geometry = "linestring"
        result_layer["geometry"] = geometry
    result_layers.append(result_layer)

input_yaml["Layer"] = result_layers

sys.stdout.write(yaml.dump(input_yaml, default_flow_style=False, width=100))
