#street_shields[zoom < 13][ref != null][ref != ''] {
  [kind = 'motorway'][zoom >= 10],
  [kind = 'trunk'][zoom >= 12],
  [kind = 'primary'][zoom >= 12],
  [kind = 'secondary'][zoom >= 13] {
    shield-name: "[ref]";
    shield-size: @shield-size;
    shield-placement: line;
    shield-spacing: @shield-spacing;
    shield-min-distance: @shield-min-distance;
    shield-face-name: @shield-font;
    shield-clip: @shield-clip;

    [kind = 'motorway'] {
      shield-fill: @motorway-shield;
      shield-file: url("symbols/shields/motorway_[ref_cols]x[ref_rows].svg");
    }

    [kind = 'trunk'] {
      shield-fill: @trunk-shield;
      shield-file: url("symbols/shields/trunk_[ref_cols]x[ref_rows].svg");
    }

    [kind = 'primary'] {
      shield-fill: @primary-shield;
      shield-file: url("symbols/shields/primary_[ref_cols]x[ref_rows].svg");
    }

    [kind = 'secondary'] {
      shield-fill: @secondary-shield;
      shield-file: url("symbols/shields/secondary_[ref_cols]x[ref_rows].svg");
    }
  }
}

#streets_shields[ref != null][ref != ''] {
  [kind = 'motorway'],
  [kind = 'trunk'],
  [kind = 'primary'],
  [kind = 'secondary'],
  [kind = 'tertiary'] {
    [zoom >= 13] {
      shield-name: "[ref]";
      shield-size: @shield-size;

      [zoom >= 16] {
        shield-size: @shield-size-z16;
      }
      [zoom >= 18] {
        shield-size: @shield-size-z18;
      }

      shield-placement: line;
      shield-spacing: @shield-spacing;
      shield-min-distance: @shield-min-distance;
      shield-face-name: @shield-font;
      shield-clip: @shield-clip;

      [kind = 'motorway'] {
        shield-fill: @motorway-shield;
        shield-file: url("symbols/shields/motorway_[ref_cols]x[ref_rows].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/motorway_[ref_cols]x[ref_rows]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/motorway_[ref_cols]x[ref_rows]_z18.svg");
        }
      }
      [kind = 'trunk'] {
        shield-fill: @trunk-shield;
        shield-file: url("symbols/shields/trunk_[ref_cols]x[ref_rows].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/trunk_[ref_cols]x[ref_rows]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/trunk_[ref_cols]x[ref_rows]_z18.svg");
        }
      }
      [kind = 'primary'] {
        shield-fill: @primary-shield;
        shield-file: url("symbols/shields/primary_[ref_cols]x[ref_rows].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/primary_[ref_cols]x[ref_rows]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/primary_[ref_cols]x[ref_rows]_z18.svg");
        }
      }
      [kind = 'secondary'] {
        shield-fill: @secondary-shield;
        shield-file: url("symbols/shields/secondary_[ref_cols]x[ref_rows].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/secondary_[ref_cols]x[ref_rows]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/secondary_[ref_cols]x[ref_rows]_z18.svg");
        }
      }
      [kind = 'tertiary'] {
        shield-fill: @tertiary-shield;
        shield-file: url("symbols/shields/tertiary_[ref_cols]x[ref_rows].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/tertiary_[ref_cols]x[ref_rows]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/tertiary_[ref_cols]x[ref_rows]_z18.svg");
        }
      }
    }
  }
}
