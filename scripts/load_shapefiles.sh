#! /usr/bin/env bash

# Load shape files into PostGIS database for rendering

set -euo pipefail

function wrong_usage {
    if [ "$#" -ne 1 ]; then
        echo "ERROR: Wrong Usage."
        echo "Usage: $0 -i SHAPE_DIRECTORY [-d DATABASE_NAME] [-u DATABASE_USER]"
        exit 1
    fi
}

SHAPE_DIRECTORY=""
DB_NAME=gis
DB_USER=$USER

while getopts "i:d:u:" ARG; do
    case $ARG in
        i)
            SHAPE_DIRECTORY=$OPTARG
            ;;
        d)
            DB_NAME=$OPTARG
            ;;
        u)
            DB_USER=$OPTARG
            ;;
    esac
done

if [ "$SHAPE_DIRECTORY" = "" ]; then
    wrong_usage
fi

echo "Loading admin_points"
ogr2ogr -f PostgreSQL "PG:dbname=$DB_NAME user=$DB_USER" "$SHAPE_DIRECTORY/admin-points-4326/admin_points.shp" -nln boundary_labels -sql "SELECT admin_leve AS admin_level, way_area, name, name_de, name_en FROM admin_points" -t_srs EPSG:3857 -lco GEOMETRY_NAME=geom
echo "Loading simplified_water_polygons"
ogr2ogr -f PostgreSQL "PG:dbname=$DB_NAME user=$DB_USER" "$SHAPE_DIRECTORY/simplified-water-polygons-split-3857/simplified_water_polygons.shp" -nln simplified_water_polygons -sql "SELECT x, y FROM simplified_water_polygons" -lco GEOMETRY_NAME=geom
echo "Loading water_polygons"
ogr2ogr -f PostgreSQL "PG:dbname=$DB_NAME user=$DB_USER" "$SHAPE_DIRECTORY/water-polygons-split-4326/water_polygons.shp" -nln ocean -sql "SELECT x, y FROM water_polygons" -t_srs EPSG:3857 -lco GEOMETRY_NAME=geom
