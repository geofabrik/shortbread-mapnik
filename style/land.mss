#land {
  [kind = 'forest'][zoom >= 7] {
    polygon-gamma: 0.3;
    [zoom = 7] {
      polygon-fill: @forest-zoom7;
    }
    [zoom = 8] {
      polygon-fill: @forest-zoom8;
    }
    [zoom = 9] {
      polygon-fill: @forest-zoom9;
    }
    [zoom = 10] {
      polygon-fill: @forest-zoom10;
    }
  }

  [kind = 'forest'],
  [kind = 'wood'] {
    [zoom >= 11] {
      polygon-gamma: 0.3;
      polygon-fill: @forest;
      /*[way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }*/
    }
  }
 
  [kind = 'grass'],
  [kind = 'meadow'],
  [kind = 'orchard'],
  [kind = 'vineyard'],
  [kind = 'allotments'],
  [kind = 'village_green'],
  [kind = 'recreation_ground'],
  [kind = 'greenhouse_horticulture'],
  [kind = 'plant_nursery'],
  [kind = 'heath'],
  [kind = 'scrub'],
  [kind = 'grassland'],
  [kind = 'swamp'],
  [kind = 'bog'],
  [kind = 'string_bog'],
  [kind = 'wet_meadow'],
  [kind = 'marsh'],
  [kind = 'golf_course'],
  [kind = 'miniature_golf'][zoom >= 15],
  [kind = 'park'],
  [kind = 'recreation_ground'],
  [kind = 'playground'],
  [kind = 'common'],
  [kind = 'garden'] {
    [zoom >= 11] {
      polygon-fill: @grass;
      polygon-gamma: 0.3;
      [kind = 'grass'],
      [kind = 'meadow'],
      [kind = 'allotments'],
      [kind = 'recreation_ground'],
      [kind = 'greenhouse_horticulture'],
      [kind = 'plant_nursery'],
      [kind = 'golf_course'],
      [kind = 'miniature_golf'][zoom >= 15],
      [kind = 'park'],
      [kind = 'recreation_ground'],
      [kind = 'playground'] {
        polygon-opacity: @grass-unimportant-opacity;
      }
    }
  }

  [kind = 'cemetery'],
  [kind = 'grave_yard'] {
    [zoom >= 13] {
      polygon-fill: @cemetery;
      polygon-gamma: 0.3;
    }
  }
 
 
  [kind = 'beach'],
  [kind = 'sand'] {
    [zoom >= 10] {
      polygon-fill: @beach;
      /*[way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }*/
    }
  }

  [kind = 'greenfield'],
  [kind = 'brownfield'],
  [kind = 'farmyard'],
  [kind = 'farmland'] {
     [zoom >= 10] { 
       polygon-fill: @farmland;
       polygon-gamma: 0.3;
       /*[way_pixels >= 4]  { polygon-gamma: 0.75; }
       [way_pixels >= 64] { polygon-gamma: 0.3;  }*/
     }
  }

  [kind = 'bare_rock'],
  [kind = 'scree'],
  [kind = 'shingle'],
  [kind = 'quarry'][zoom >= 11] {
      polygon-fill: @quarry;
      polygon-gamma: 0.3;
      /*[way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }*/
  }
 
  [kind = 'landfill'],
  [kind = 'railway'],
  [kind = 'retail'],
  [kind = 'industrial'],
  [kind = 'commercial'],
  [kind = 'residential']{
    [zoom >= 10] { 
      polygon-fill: @builtup;
      /*[way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }*/
    }
  }
}


#sites {  
  [kind = 'sports_center'],
  [kind = 'university'],
  [kind = 'hospital'] {
    [zoom >= 14] {
      polygon-fill: @societal;
      polygon-gamma: 0.3;
    }
  }
}
