@water:      #c4dff6;
@glacier:    #EFF6FD;
@glacier-line: @water;

@water-text:  #6699cc;

#ocean {
  polygon-fill: @water;
  polygon-gamma: 0.5;
}

#water_polygons {
  [kind = 'glacier'] {
    polygon-fill: @glacier;
    line-color: @glacier-line;
    line-width: 0.4;
    [zoom >= 9] { line-width: 0.7; }
    [zoom >= 11 ] { line-width: 0.9;  }
  }

  [kind = 'water'],
  [kind = 'dock'],
  [kind = 'reservoir'],
  [kind = 'basin'] {
    polygon-fill: @water;
  }

  [kind = 'riverbank'] {
    polygon-fill: @water;
  }
  [kind = 'canal'] {
    polygon-fill: @water;
  }

}

#water_lines {
  [kind = 'river'][zoom >= 9][zoom < 12 ]{
    line-color: @water;
    line-width: 0.7;
    [zoom >= 9] { line-width: 0.9; }
    [zoom >= 10] { line-width: 1.2; }
  }

  [kind = 'canal'][zoom >= 12],
  [kind = 'river'][zoom >= 12] {
    line-color: @water;
    line-width: 2;
    [zoom >= 13] { line-width: 3; }
    [zoom >= 14] { line-width: 5; }
    [zoom >= 15] { line-width: 7; }
    [zoom >= 17] { line-width: 9; }
    [zoom >= 18] { line-width: 12; }
  }

  [kind = 'stream'][zoom >= 14] {
    line-color: @water;
    line-width: 2;
    [zoom >= 15] { line-width: 3;}
    [zoom >= 17] { line-width: 5;}
  }

  [kind = 'ditch'] [zoom >= 15 ] {
    line-color: @water;
    line-width: 0.7;
  }
}

#water_lines_labels {
  [kind = 'river'][zoom >= 13] {
    text-name: "[name]";
    text-face-name: @oblique-fonts;
    text-placement: line;
    text-fill: @water-text;
    text-spacing: 400;
    text-size: 8;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    [zoom >= 14] { text-size: 12; }
  }

  [kind = 'canal'][zoom >= 14] {
    text-name: "[name]";
    text-size: 10;
    text-fill: @water-text;
    text-placement: line;
    text-face-name: @oblique-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [kind = 'stream'][zoom >= 15] {
    text-name: "[name]";
    text-size: 10;
    text-face-name: @oblique-fonts;
    text-fill: @water-text;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-spacing: 600;
    text-placement: line;
    text-vertical-alignment: middle;
    text-dy: 8;
  }

  [kind = 'ditch'] {
    [zoom >= 15] {
      text-name: "[name]";
      text-face-name: @oblique-fonts;
      text-size: 10;
      text-fill: @water-text;
      text-spacing: 600;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

}


#water_polygons_labels {
  [kind = 'glacier'] {
    [zoom >= 15] {
      text-name: "[name]";
      text-face-name: @oblique-fonts;
      text-size: 10;
      text-fill: @water-text;
      text-spacing: 600;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-placement: interior;
    }
  }

  [kind = 'water'] {
    [zoom >= 15] {
      text-name: "[name]";
      text-face-name: @oblique-fonts;
      text-size: 10;
      text-fill: @water-text;
      text-spacing: 600;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-placement: interior;
    }
  }
}
