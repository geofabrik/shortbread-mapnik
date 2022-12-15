#! /usr/bin/env python3

import argparse
import json
import sys
import yaml


strict = False
error = False

def log(label, msg):
    sys.stderr.write("{}: {}\n".format(label, msg))


def warn(msg):
    log("WARNING", msg)
    if strict:
        error = True


def error(msg):
    log("ERROR", msg)
    error = True


parser = argparse.ArgumentParser(description="Compare layers defined in a MML file with layers defined in Tilemaker configuration.")
parser.add_argument("-s", "--strict", action="store_true", help="Fail on warnings.")
parser.add_argument("mml_file", type=argparse.FileType("r"), help="Map style input .mml file")
parser.add_argument("tilemaker_file", type=argparse.FileType("r"), help="Tilemaker configuration file (.json)")
args = parser.parse_args()

if args.strict:
    strict = True

# Read MML file
input_yaml = yaml.safe_load(args.mml_file)
mml_layers = input_yaml.get("Layer", [])

# Read JSON file
input_json = json.load(args.tilemaker_file)
tilemaker_layers = input_json["layers"]

mml_layer_names = set()
for mml_layer in mml_layers:
    source = mml_layer.get("Datasource", {}).get("layer", mml_layer["id"])
#    if source not in tilemaker_layers:
#        error("Layer {} used in MML but missing in Tilemaker configuration".format(source))
    mml_layer_names.add(source)

tilemaker_layer_names = set()
for t_layer, properties in tilemaker_layers.items():
    name = t_layer
    write_to = properties.get("write_to")
    if write_to:
        name = write_to
    tilemaker_layer_names.add(name)

diff = mml_layer_names.difference(tilemaker_layer_names)
for k in diff:
    error("Layer {} used in MML but missing in Tilemaker configuration".format(k))
diff = tilemaker_layer_names.difference(mml_layer_names)
for k in diff:
    warn("Layer {} defined in Tilemaker configuration but missing in MML file. Please check if this is intentional.".format(k))

if error:
    exit(1)
