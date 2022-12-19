local tables = {}
inf_zoom = 99

tables.place_labels = osm2pgsql.define_node_table('place_labels', {
    { column = 'minzoom', type = 'int' },
    { column = 'kind',    type = 'text' },
    { column = 'name',    type = 'text' },
    { column = 'name_de',    type = 'text' },
    { column = 'name_en',    type = 'text' },
    { column = 'population', type = 'int' },
    { column = 'geom',       type = 'point', projection = 3857, not_null = true },
})

tables.boundaries = osm2pgsql.define_table({
    name = 'boundaries',
    ids = { type = 'any', id_column = 'osm_id', type_column = 'osm_type'},
    columns = {
        { column = 'maritime',    type = 'bool' },
        { column = 'admin_level',    type = 'int' },
        { column = 'geom',       type = 'multilinestring', projection = 3857 },
    }
})

tables.addresses = osm2pgsql.define_table({
    name = 'addresses',
    ids = { type = 'any', id_column = 'osm_id', type_column = 'osm_type'},
    columns = {
        { column = 'name',    type = 'text' },
        { column = 'number',  type = 'text' },
        -- { column = 'geom',    type = 'point', projection = 3857, create_only = true },
        -- { column = 'orig_geom',    type = 'geometry', projection = 3857 },
        { column = 'geom',       type = 'point', projection = 3857, not_null = true },
    }
})

tables.water_lines = osm2pgsql.define_way_table('water_lines', {
    { column = 'kind',    type = 'text' },
    { column = 'geom',    type = 'linestring', projection = 3857 },
})

tables.water_lines_labels = osm2pgsql.define_way_table('water_lines_labels', {
    { column = 'kind',    type = 'text' },
    { column = 'name',    type = 'text' },
    { column = 'name_en',    type = 'text' },
    { column = 'name_de',    type = 'text' },
    { column = 'geom',    type = 'linestring', projection = 3857 },
})

tables.street_polygons = osm2pgsql.define_area_table('street_polygons', {
    { column = 'bridge',    type = 'bool' },
    { column = 'kind',    type = 'text' },
    { column = 'rail',    type = 'bool' },
    { column = 'service',    type = 'text' },
    { column = 'surface',    type = 'text' },
    { column = 'tunnel',    type = 'bool' },
    { column = 'z_order',    type = 'real' },
    { column = 'geom',    type = 'geometry', projection = 3857 },
})

tables.street_polygons_labels = osm2pgsql.define_area_table('street_polygons_labels', {
    { column = 'kind',    type = 'text' },
    { column = 'name',    type = 'text' },
    { column = 'name_en',    type = 'text' },
    { column = 'name_de',    type = 'text' },
    --{ column = 'geom',    type = 'point', projection = 3857 },
    { column = 'z_order',    type = 'real' },
    -- { column = 'geom',    type = 'point', projection = 3857, create_only = true },
    -- { column = 'orig_geom',    type = 'geometry', projection = 3857 },
    { column = 'geom',    type = 'point', projection = 3857, not_null = true }
})

tables.streets_low = osm2pgsql.define_way_table('streets_low', {
    { column = 'kind',    type = 'text' },
    { column = 'rail',    type = 'bool' },
    { column = 'minzoom',    type = 'int' },
    { column = 'z_order',    type = 'real' },
    { column = 'geom',    type = 'linestring', projection = 3857 },
})

tables.streets_med = osm2pgsql.define_way_table('streets_med', {
    { column = 'bridge',    type = 'bool' },
    { column = 'kind',    type = 'text' },
    { column = 'link',    type = 'bool' },
    { column = 'rail',    type = 'bool' },
    { column = 'service',    type = 'text' },
    { column = 'surface',    type = 'text' },
    { column = 'tracktype',    type = 'text' },
    { column = 'tunnel',    type = 'bool' },
    { column = 'minzoom',    type = 'int' },
    { column = 'z_order',    type = 'real' },
    { column = 'geom',    type = 'linestring', projection = 3857 },
})

tables.streets = osm2pgsql.define_way_table('streets', {
    { column = 'bicycle',    type = 'text' },
    { column = 'bridge',    type = 'bool' },
    { column = 'horse',    type = 'text' },
    { column = 'kind',    type = 'text' },
    { column = 'link',    type = 'bool' },
    { column = 'rail',    type = 'bool' },
    { column = 'service',    type = 'text' },
    { column = 'surface',    type = 'text' },
    { column = 'tracktype',    type = 'text' },
    { column = 'tunnel',    type = 'bool' },
    { column = 'minzoom',    type = 'int' },
    { column = 'z_order',    type = 'real' },
    { column = 'geom',    type = 'linestring', projection = 3857 },
})

tables.street_labels = osm2pgsql.define_way_table('street_labels', {
    { column = 'kind',    type = 'text' },
    { column = 'tunnel',    type = 'bool' },
    { column = 'name',    type = 'text' },
    { column = 'name_en',    type = 'text' },
    { column = 'name_de',    type = 'text' },
    { column = 'ref',    type = 'text' },
    { column = 'ref_cols',    type = 'int' },
    { column = 'ref_rows',    type = 'int' },
    { column = 'minzoom',    type = 'int' },
    { column = 'z_order',    type = 'real' },
    { column = 'geom',    type = 'linestring', projection = 3857 },
})

tables.street_labels_points = osm2pgsql.define_node_table('street_labels_points', {
    { column = 'kind',    type = 'text' },
    { column = 'name',    type = 'text' },
    { column = 'name_en',    type = 'text' },
    { column = 'name_de',    type = 'text' },
    { column = 'ref',    type = 'text' },
    { column = 'geom',    type = 'point', projection = 3857 },
})

tables.aerialways = osm2pgsql.define_way_table('aerialways', {
    { column = 'kind',    type = 'text' },
    { column = 'geom',    type = 'linestring', projection = 3857 },
})

tables.public_transport = osm2pgsql.define_table({
    name = 'public_transport',
    ids = { type = 'any', id_column = 'osm_id', type_column = 'osm_type'},
    columns = {
        { column = 'iata',    type = 'text' },
        { column = 'kind',    type = 'text' },
        { column = 'name',    type = 'text' },
        { column = 'name_en',    type = 'text' },
        { column = 'name_de',    type = 'text' },
        -- { column = 'geom',       type = 'point', projection = 3857, create_only = true },
        -- { column = 'orig_geom',       type = 'geometry', projection = 3857 },
        { column = 'geom',    type = 'point', projection = 3857, not_null = true },
    }
})

tables.buildings = osm2pgsql.define_area_table('buildings', {
    { column = 'dummy',    type = 'int' },
    { column = 'geom',    type = 'geometry', projection = 3857 },
})

tables.water_polygons = osm2pgsql.define_area_table('water_polygons', {
    { column = 'kind',    type = 'text' },
    { column = 'geom',    type = 'geometry', projection = 3857 },
})

tables.water_polygons_labels = osm2pgsql.define_area_table('water_polygons_labels', {
    { column = 'kind',    type = 'text' },
    { column = 'name',    type = 'text' },
    { column = 'name_en',    type = 'text' },
    { column = 'name_de',    type = 'text' },
    { column = 'way_area',    type = 'area' },
    { column = 'geom',    type = 'point', projection = 3857, not_null = true },
})

tables.land = osm2pgsql.define_area_table('land', {
    { column = 'kind',    type = 'text' },
    { column = 'minzoom',    type = 'int' },
    { column = 'geom',    type = 'geometry', projection = 3857 },
})

tables.sites = osm2pgsql.define_area_table('sites', {
    { column = 'kind',    type = 'text' },
    { column = 'geom',    type = 'geometry', projection = 3857 },
})

function osm2pgsql.process_node(object)
    local place = object.tags.place
    if place ~= nil then
        process_place(object)
    end
    -- Layer addresses
    if object.tags["addr:housenumber"] ~= nil or object.tags["addr:housename"] ~= nil then
        process_addresses(object, false)
    end
    if object.tags.highway == "motorway_junction" then
        process_street_labels_points(object)
    end
    -- Layer public_transport 
    local railway = object.tags.railway
    local aeroway = object.tags.aeroway
    local aerialway = object.tags.aerialway
    if railway == "station" or railway == "halt" or aeroway == "aerodrome" or aerialway == "station" then
        process_public_transport_layer(object, false)
    end
end

function osm2pgsql.process_way(object)
    if not object.is_closed then
        if object.tags.waterway then
            process_water_lines(object)
        end
        if object.tags.highway or object.tags.railway or object.tags.aeroway then
            process_streets(object)
            process_street_labels(object)
        end
        -- Layer aerialways
        if object.tags.aerialway then
            process_aerialways(object)
        end
    else
        process_area(object)
    end
end

function osm2pgsql.process_relation(object)
    local rel_type = object.tags.type
    local boundary = object.tags.boundary
    local admin_level = object.tags.admin_level
    if rel_type == 'boundary' and boundary == 'administrative' and (admin_level == '2' or admin_level == '4') then
        process_boundaries(object)
    end
    if object.tags.type == "boundary" or object.tags.type == "multipolygon" then
        process_area(object)
    end
end

function process_area(object)
    local area_tag = object.tags.area
    -- Areas which aren't areas but just closed ways
    if (area_tag == nil or area_tag == 'no') and (object.tags.highway or object.tags.railway or object.tags.aeroway) then
        process_streets(object)
        process_street_labels(object)
    end
    -- Layer addresses
    if object.tags["addr:housenumber"] ~= nil or object.tags["addr:housename"] ~= nil then
            process_addresses(object, true)
    end
    -- Layer street_polygons
    if object.tags.highway then
            process_street_polygons(object)
    end
    -- Layer buildings
    if object.tags.building then
            process_buildings(object)
    end
    -- Layer water_polygons
    -- Layers water_polygons, water_polygons_labels
    if object.tags.water or object.tags.natural or object.tags.landuse then
        process_water_polygons(object)
    end

    -- Layer land
    if object.tags.landuse or object.tags.natural or object.tags.wetland or object.tags.amenity == "grave_yard" or object.tags.leisure or object.tags.man_made == "pier" then
        process_land(object)
    end
    -- Layer public_transport 
    local railway = object.tags.railway
    local aeroway = object.tags.aeroway
    local aerialway = object.tags.aerialway
    if railway == "station" or railway == "halt" or aeroway == "aerodrome" or aerialway == "station" then
        process_public_transport_layer(object, true)
    end
    -- Layer sites
    if object.tags.amenity or object.tags.leisure or object.tags.military or object.tags.landuse then
        process_sites(object)
    end
end

function process_addresses(obj, is_area)
    row = {
        name = obj.tags["addr:housename"],
        number = obj.tags["addr:housenumber"],
    }
    if is_area then
        row.geom = obj:as_multipolygon():centroid()
    else
        row.geom = obj:as_point()
    end
    tables.addresses:insert(row)
end

function process_water_polygons(obj)
    local waterway = obj.tags.waterway
    local natural = obj.tags.natural
    local landuse = obj.tags.landuse
    local kind = ""
    if landuse == "reservoir" or landuse == "basin" or natural == "water" or natural == "glacier" then
        if landuse == "reservoir" or landuse == "basin" then
            kind = landuse
        elseif natural == "water" or natural == "glacier" then
            kind = natural
        end
    elseif waterway == "riverbank" or waterway == "dock" or waterway == "canal" then
        kind = waterway
    end
    if kind ~= "" then
        row = {
            kind = kind,
            geom = { create = "area" }
        }
        tables.water_polygons:add_row(row)
        row.geom = obj:as_multipolygon():centroid()
        tables.water_polygons_labels:insert(setNameAttributes(obj, row))
    end
end

function process_land(obj)
    local landuse = obj.tags.landuse
    local natural = obj.tags.natural
    local wetland = obj.tags.wetland
    local leisure = obj.tags.leisure
    local kind = ""
    local mz = inf_zoom
    if landuse == "forest" or natural == "wood" then
        kind = "forest"
        mz = 7
    elseif landuse == "residential" or landuse == "industrial" or landuse == "commercial" or landuse == "retail" or landuse == "railway" or landuse == "landfill" or landuse == "brownfield" or landuse == "greenfield" or landuse == "farmyard" or landuse == "farmland" then
        kind = landuse
        mz = 10
    elseif landuse == "grass" or landuse == "meadow" or landuse == "orchard" or landuse == "vineyard" or landuse == "allotments" or landuse == "village_green" or landuse == "recreation_ground" or landuse == "greenhouse_horticulture" or landuse == "plant_nursery" or landuse == "quarry" then
        kind = landuse
        mz = 11
    elseif natural == "sand" or natural == "beach" then
        kind = natural
        mz = 10
    elseif natural == "wood" or natural == "heath" or natural == "scrub" or natural == "grassland" or natural == "bare_rock" or natural == "scree" or natural == "shingle" or natural == "sand" or natural == "beach" then
        kind = natural
        mz = 11
    elseif wetland == "swamp" or wetland == "bog" or wetland == "string_bog" or wetland == "wet_meadow" or wetland == "marsh" then
        kind = wetland
        mz = 11
    elseif obj.tags.amenity == "grave_yard" then
        kind = "grave_yard"
        mz = 13
    elseif leisure == "golf_course" or leisure == "park" or leisure == "garden" or leisure == "playground" or leisure == "miniature_golf" then
        kind = leisure
        mz = 11
    elseif obj.tags.man_made == "pier" then
        kind = "pier"
        mz = 11
    elseif landuse == "cemetery" then
        kind = "cemetery"
        mz = 13
    end
    if mz < inf_zoom then
        tables.land:add_row({
            kind = kind,
            geom = { create = "area" },
            minzoom = mz
        })
    end
end

function process_sites(obj)
    local kind = ""
    local amenity =  obj.tags.amenity
    local military = obj.tags.military
    local leisure =  obj.tags.leisure
    local landuse =  obj.tags.landuse
    local mz = inf_zoom
    if amenity == "university" or amenity == "hospital" or amenity == "prison" or amenity == "parking" or amenity == "bicycle_parking" then
        kind = amenity
        mz = 14
    elseif leisure == "sports_center" then
        kind = leisure
        mz = 14
    elseif landuse == "construction" then
        kind = landuse
        mz = 14
    elseif military == "danger_area" then
        kind = military
        mz = 14
    end
    if mz < inf_zoom then
        tables.sites:add_row({
            kind = kind,
            geom = { create = "area" }
        })
    end
end

function process_buildings(obj)
    local building = obj.tags.building
    if building ~= nil and building ~= "no" then
        tables.buildings:add_row({
            dummy = 1,
            geom = { create = "area" }
        })
    end
end

function process_public_transport_layer(obj, is_area)
    local railway = obj.tags.railway
    local aeroway = obj.tags.aeroway
    local aerialway = obj.tags.aerialway
    local kind = ""
    local mz = inf_zoom
    if railway == "station" or railway == "halt" then
        kind = railway
        mz = 13
    elseif railway == "tram_stop" then
        kind = railway
        mz = 14
    elseif aerialway == "station" then
        kind = "aerialway_station"
        mz = 13
    else
        kind = obj.tags.aeroway
        mz = 11
    end
    row = {
        kind = kind
    }
    if is_area then
        row.geom = obj:as_multipolygon():centroid()
    else
        row.geom = obj:as_point()
    end
    if obj.tags.iata then
        row.iata = iata
    end
    tables.public_transport:insert(setNameAttributes(obj, row))
end


function process_aerialways(way)
    local aerialway = way.tags.aerialway
    if aerialway == "cable_car" or aerialway == "gondola" or aerialway == "chair_lift" or aerialway == "drag_lift" or aerialway == "t-bar" or aerialway == "j-bar" or aerialway == "platter" or aerialway == "rope_tow" then
        tables.aerialways:add_row({
            kind = aerialway,
            geom = { create = "line" },
        })
    end
end

function process_street_labels_points(node)
    if node.tags.highway == "motorway_junction" then
        row = {
            min_zoom = 12,
            kind = highway,
            ref = node.tags.ref,
            geom = { create = "point" }
        }
        tables.street_labels_points:add_row(setNameAttributes(node, row))
    end
end

function process_streets(way)
    local min_zoom_layer = 5
    local mz = inf_zoom
    local kind = ""
    local highway = way.tags.highway
    local railway = way.tags.railway
    local aeroway = way.tags.aeroway
    local surface = way.tags.surface
    local bicycle = way.tags.bicycle
    local horse = way.tags.horse
    local tracktype = way.tags.tracktype
    local tunnelBool = toTunnelBool(way.tags.tunnel, way.tags.covered)
    local covered = way.tags.covered
    local service = way.tags.service
    local bridgeBool = toBridgeBool(way.tags.bridge)
    local name = way.tags.name
    local rail = false
    if not name then
        name = way.tags.ref
    end
    if highway then
        if highway == "motorway" or highway == "motorway_link" then
            mz = min_zoom_layer
            kind = "motorway"
        elseif highway == "trunk" or highway == "trunk_link" then
            mz = 6
            kind = "trunk"
        elseif highway == "primary" or highway == "primary_link" then
            mz = 8
            kind = "primary"
        elseif highway == "secondary" or highway == "secondary_link" then
            mz = 9
            kind = "secondary"
        elseif highway == "tertiary" or highway == "tertiary_link" then
            mz = 10
            kind = "tertiary"
        elseif highway == "unclassified" or highway == "residential" then
            mz = 12
            kind = highway
        elseif highway == "living_street" or highway == "pedestrian" or highway == "track" then
            mz = 13
            kind = highway
        elseif highway == "service" then
            mz = 14
            kind = highway
        elseif highway == "footway" or highway == "steps" or highway == "path" or highway == "cycleway" then
            mz = 13
            kind = highway
        end
    elseif (railway == "rail" or railway == "narrow_gauge") and not service then
        kind = railway
        rail = true
        mz = 8
    elseif ((railway == "rail" or railway == "narrow_gauge") and service)
        or railway == "light_rail" or railway == "tram" or railway == "subway"
        or railway == "funicular" or railway == "monorail" then
        kind = railway
        rail = true
        mz = 10
    elseif aeroway == "runway" then
        kind = aeroway
        mz = 11
    elseif aeroway == "taxiway" then
        kind = aeroway
        mz = 13
    end
    if kind ~= "" and surface then
        if surface == "unpaved" or surface == "compacted" or surface == "dirt" or surface == "earth" or surface == "fine_gravel" or surface == "grass" or surface == "grass_paver" or surface == "gravel" or surface == "ground" or surface == "mud" or surface == "pebblestone" or surface == "salt" or surface == "woodchips" or surface == "clay" then
            suface = "unpaved"
        elseif surface == "paved" or surface == "asphalt" or surface == "cobblestone" or surface == "cobblestone:flattended" or surface == "sett" or surface == "concrete" or surface == "concrete:lanes" or surface == "concrete:plates" or surface == "paving_stones" then
            suface = "unpaved"
        else
            surface = ""
        end
    end
    local link = (highway == "motorway_link" or highway == "trunk_link" or highway == "primary_link" or highway == "secondary_link" or highway == "tertiary_link")
    local layer = tonumber(way.tags.layer)
    if layer == nil then
        layer = 0
    end
    local z_order = getZOrder(way, rail, false)
    if mz <= 13 then
        local row_med = {
            kind = kind,
            link = link,
            surface = surface,
            tunnel = tunnelBool,
            bridge = bridgeBool,
            rail = rail,
            z_order = z_order,
            minzoom = mz,
            geom = { create = "line" }
        }
        if tracktype then
            row.tracktype = tracktype
        end
        if service then
            row.service = service
        end
        tables.streets_med:add_row(row_med)
    end
    if mz < inf_zoom then
        local row = {
            kind = kind,
            link = link,
            surface = surface,
            bicycle = bicycle,
            horse = horse,
            tunnel = tunnelBool,
            bridge = bridgeBool,
            rail = rail,
            z_order = z_order,
            geom = { create = "line" }
        }
        if tracktype then
            row.tracktype = tracktype
        end
        if service then
            row.service = service
        end
        tables.streets:add_row(row)
    end
    if mz < 9 then
        tables.streets_low:add_row({
            min_zoom = mz,
            kind = kind,
            rail = rail,
            z_order = z_order,
            minzoom = mz,
            geom = { create = "line" }
        })
    end
end

function process_street_labels(way)
    local highway = way.tags.highway
    local ref = way.tags.ref
    local name = way.tags.name
    local mz = inf_zoom
    local kind = ""
    if highway == "motorway" then
        mz = 10
        kind = highway
    elseif highway == "trunk" or highway == "primary" then
        mz = 12
        kind = highway
    elseif highway == "secondary" or highway == "tertiary" then
        mz = 13
        kind = highway
    elseif highway == "motorway_link" then
        mz = 13
        kind = "motorway"
        link = true
    elseif highway == "trunk_link" then
        mz = 13
        kind = "trunk"
        link = true
    elseif highway == "primary_link" then
        mz = 13
        kind = "primary"
        link = true
    elseif highway == "secondary_link" then
        mz = 13
        kind = "secondary"
        link = true
    elseif highway == "tertiary_link" then
        mz = 14
        kind = "tertiary"
        link = true
    elseif highway == "unclassified" or highway == "residential" or highway == "living_street" or highway == "pedestrian" or highway == "track" or highway == "service" or highway == "footway" or highway == "steps" or highway == "path" or highway == "cycleway" then
        mz = 14
        kind = highway
    end
    local refs = ""
    local rows = 0
    local cols = 0
    if mz < inf_zoom and ref ~= nil and ref ~= "" then
        for word in string.gmatch(ref, "([^;]+);?") do
            rows = rows + 1
            cols = math.max(cols, string.len(word))
            if rows == 1 then
                refs = word
            else
                refs = refs .. "\n" .. word
            end
        end
    elseif mz >= inf_zoom then
        return
    end
    if (name or refs ~= "") then
        row = {
            min_zoom = mz,
            kind = kind,
            ref = refs,
            ref_cols = cols,
            ref_rows = rows,
            minzoom = mz,
            z_order = getZOrder(way, false, false),
            geom = { create = "line" }
        }
        tables.street_labels:add_row(setNameAttributes(way, row))
    end
end

function process_street_polygons(way)
    local highway = way.tags.highway
    local surface = way.tags.surface
    local service = way.tags.service
    local kind = nil
    local mz = inf_zoom
    if highway == "pedestrian" or highway == "service" then
        mz = 14
        kind = highway
    end
    if mz < inf_zoom then
        local row = {
            kind = kind,
            tunnel = toTunnelBool(way.tags.tunnel, way.tags.covered),
            bridge = toBridgeBool(way.tags.bridge),
            rail = false,
            z_order = getZOrder(way, rail, false),
            geom = { create = 'area' }
        }
        if way.tags.surface then
            row.surface = way.tags.surface
        end
        if way.tags.service then
            row.service = way.tags.service
        end
        tables.street_polygons:add_row(row)
        local name = way.tags.name
        if name then
            tables.street_polygons_labels:insert({
                kind = kind,
                z_order = getZOrder(way, rail, false),
                geom = way:as_multipolygon():centroid()
                --orig_geom = { create = 'area' }
            })
        end
    end
end

-- Get z_order
function getZOrder(way, is_rail, ignore_bridge)
	local highway = way.tags.highway
	local railway = way.tags.highway
	local layer = tonumber(way.tags.layer)
	local zOrder = 0
	local Z_STEP = 14
	if not ignore_bridges and toBridgeBool(way) then
		zOrder = zOrder + Z_STEP
	elseif toTunnelBool(way) then
		zOrder = zOrder - Z_STEP
	end
	if not (layer == nil) then
		if layer > 7 then
			layer = 7
		elseif layer < -7 then
			layer = -7
		end
		zOrder = zOrder + layer * Z_STEP
	end
	local hwClass = 0
	if is_rail and railway == "rail" and not way.tags.service then
		hwClass = 13
	elseif is_rail and railway == "rail" then
		hwClass = 12
	elseif is_rail and (israilway == "subway" or railway == "light_rail" or railway == "tram" or railway == "funicular" or railway == "monorail") then
		hwClass = 11
	elseif highway == "motorway" then
		hwClass = 10
	elseif highway == "trunk"  then
		hwClass = 9
	elseif highway == "primary"  then
		hwClass = 8
	elseif highway == "secondary"  then
		hwClass = 7
	elseif highway == "tertiary"  then
		hwClass = 6
	elseif highway == "unclassified" or highway == "residential" or highway == "road" or highway == "motorway_link" or highway == "trunk_link" or highway == "primary_link" or highway == "secondary_link" or highway == "tertiary_link" then
		hwClass = 5
	elseif highway == "living_street" or highway == "pedestrian" then
		hwClass = 4
	elseif highway == "service" then
		hwClass = 3
	elseif highway == "foootway" or highway == "bridleway" or highway == "cycleway" or highway == "path" or highway == "track" then
		hwClass = 2
	elseif highway == "steps" or highway == "platform" then
		hwClass = 1
	end
	zOrder = zOrder + hwClass
	return zOrder
end

function toTunnelBool(tunnel, covered)
	if tunnel == "yes" or tunnel == "building_passage" or covered == "yes" then
		return true
	end
	return false
end

function toBridgeBool(bridge)
	if bridge == "yes" then
		return true
	end
	return false
end

function process_water_lines(way)
    if way.is_closed then
        return
    end
    local kind = way.tags.waterway
    local mz = inf_zoom
    local mz_label = inf_zoom
    mz = inf_zoom
    if kind == "river" or kind == "canal" then
        mz = 9
        mz_label = 13
    elseif kind == "canal" then
        mz = 12
        mz_label = 14
    elseif kind == "drain" or kind == "stream" then
        mz = 13
        mz_label = 14
    elseif kind == "ditch" then
        mz = 14
        mz_label = 14
    end
    if mz < inf_zoom then
        tables.water_lines:add_row({
            kind = kind,
            geom = { create = 'line' }
        })
        if way.tags.name then
            row = {
                kind = kind,
                geom = { create = 'line' }
            }
            tables.water_lines_labels:add_row(setNameAttributes(way, row))
        end
    end
end

function process_addresses(obj, is_area)
    row = {
        name = obj.tags["addr:housename"],
        number = obj.tags["addr:housenumber"],
    }
    if is_area then
        row.geom = obj:as_multipolygon():centroid()
    else
        row.geom = obj:as_point()
    end
    tables.addresses:insert(row)
end

function process_boundaries(rel)
    local admin_level = rel.tags.admin_level
    local al = tonumber(admin_level)
    if al ~= nil then
        tables.boundaries:add_row({
            maritime = rel.tags.maritime,
            admin_level = al,
            geom = { create = 'line' }
        })
    end

end

function process_place(object)
    local mz = 99
    local place = object.tags.place
    local population = object.tags.population
    if place == "city" then
        mz = 6
        if not population then
            population = "100000"
        end
    elseif place == "town" then
        mz = 7
        if not population then
            population = "5000"
        end
    elseif place == "village" then
        mz = 10
        if not population then
            population = "100"
        end
    elseif place == "hamlet" then
        mz = 10
        if not population then
            population = "50"
        end
    elseif place == "suburb" then
        mz = 10
        if not population then
            population = "1000"
        end
    elseif place == "neighbourhood" then
        mz = 10
        if not population then
            population = "100"
        end
    elseif place == "locality" or place == "island" then
        mz = 10
        if not population then
            population = "0"
        end
    elseif  place == "isolated_dwelling" or place == "farm"  then
        mz = 10
        if not population then
            population = "5"
        end
    end
    local kind = place
    if (place == "city" or place == "town" or place == "village" or place == "hamlet") and object.tags["capital"] ~= nil then
        local capital = object.tags.capital
        if capital == "yes" then
            mz = 4
            kind = "capital"
        elseif capital == "4" then
            mz = 4
            kind = "state_capital"
        end
    end
    if mz < 99 then
        local populationNum = tonumber(population)
        row = {
            minzoom = mz,
            kind = kind,
            population = populationNum,
            geom = object:as_point()
        }
        tables.place_labels:insert(setNameAttributes(object, row))
    end
end


-- Set name, name_en, and name_de on any object
function setNameAttributes(obj, row)
   local name = obj.tags.name
   local name_de = obj.tags["name:de"]
   local name_en = obj.tags["name:en"]
   if name or name_de or name_en then
       row.name = fillWithFallback(name, name_en, name_de)
       row.name_de = fillWithFallback(name_de, name, name_en)
       row.name_en = fillWithFallback(name_en, name, name_de)
   end
   return row
end


function fillWithFallback(value1, value2, value3)
    if value1 ~= "" then
        return value1
    end
    if value2 ~= "" then
        return value2
    end
    return value3
end
