#boundaries {
  [admin_level = 2] {
    [zoom >= 1] {
      background/line-join: bevel;
      background/line-color: white;
      background/line-width: 0.2;
      line-join: bevel;
      line-color: @admin-boundaries;
      line-width: 0.2;
    }
    [zoom >= 2] {
      background/line-width: 0.3;
      line-width: 0.3;
    }
    [zoom >= 3] {
      background/line-width: 0.4;
      line-width: 0.4;
    }
    [zoom >= 4] {
      background/line-width: 0.8;
      line-width: 0.8;
    }
    [zoom >= 7] {
      background/line-width: 0.9;
      line-width: 0.9;
    }
    [zoom >= 10] {
      background/line-width: 1.0;
      line-width: 1.0;
    }
  }

  [admin_level = 4] {
    [zoom >= 7] {
      background/line-join: bevel;
      background/line-color: white;
      background/line-width: 0.4;
      line-color: @admin-boundaries;
      line-join: bevel;
      line-width: 0.4;
      line-dasharray: 4,3;
      line-clip: false;
    }
    [zoom >= 10] {
      background/line-width: 0.6;
      line-width: 0.6;
    }
  }

  /*
    The following code prevents admin boundaries from being rendered on top of
    each other. Comp-op works on the entire attachment, not on the individual
    border. Therefore, this code generates an attachment containing a set of
    @admin-boundaries/white dashed lines (of which only the top one is visible),
    and with `comp-op: darken` the white part is ignored, while the
    @admin-boundaries colored part is rendered (as long as the background is not
    darker than @admin-boundaries).
    The SQL has `ORDER BY admin_level`, so the boundary with the lowest
    level is rendered on top, and therefore the only visible boundary.
     */
  opacity: 0.9;
  comp-op: darken;
}


#boundary_labels {
  /* way_area is in ha, not m². */
  [zoom >= 3][admin_level = "2"][way_area > 10E6] {
      text-name:           "[name_de]";
      text-size:           10;
      text-wrap-width:     35;
      text-line-spacing:   -1.5;
      text-margin:         10;

      text-fill:           @country;
      text-face-name:      @book-fonts;
      text-halo-fill:      @standard-halo-fill;
      text-halo-radius:    @standard-halo-radius * 2;
      text-placement:      interior;
      text-character-spacing: 0.5;
   }

   [zoom >= 7][admin_level = "4"][way_area > 10E4] {
      text-name: "[name_de]";
      text-size: 10;
      text-wrap-width: 30; // 3.0 em
      text-line-spacing: -1.5; // -0.15 em
      text-margin: 7.0; // 0.7 em
      text-fill: @state;
      text-face-name: @oblique-fonts;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-placement: interior;
   }

}

#place_labels {
  [kind = "capital"][zoom < 7 ],
  [kind = "state_capital"][zoom >= 4][zoom < 7][population > 600000],
  [kind = "state_capital"][zoom >= 5][zoom < 7] {
    shield-file: url('symbols/place/place-capital-6.svg');
    shield-text-dx: 6;
    shield-text-dy: 6;
    shield-name: '[name_en]';
    shield-face-name: @book-fonts;
    shield-fill: @place;
    shield-size: 10;
    shield-wrap-width: 30; // 2.7 em
    shield-line-spacing: -1.6; // -0.15 em
    shield-margin: 7.7; // 0.7 em
    shield-halo-fill: @standard-halo-fill;
    shield-halo-radius: @standard-halo-radius * 1.5;
    shield-placement-type: simple;
    shield-placements: 'S,N,E,W';
    /*[dir = 1] {
          shield-placements: 'N,S,E,W';
    }*/
    shield-unlock-image: true;
  
    [zoom >= 5] {
      shield-size: 12;
      shield-wrap-width: 60; // 5.0 em
      shield-line-spacing: -0.6; // -0.05 em
      shield-margin: 8.4; // 0.7 em
    }
  }

  [kind = "capital"][zoom >= 7][zoom <= 12],
  [kind = "city"][zoom <= 12] {
    [zoom >= 7] {
      shield-file: url('symbols/place/place-capital-6.svg');
      shield-text-dx: 6;
      shield-text-dy: 6;
      shield-name: '[name_en]';
      shield-face-name: @book-fonts;
      shield-fill: @place;
      shield-size: 12;
      shield-wrap-width: 30; // 2.7 em
      shield-line-spacing: -1.6; // -0.15 em
      shield-margin: 7.7; // 0.7 em
      shield-halo-fill: @standard-halo-fill;
      shield-halo-radius: @standard-halo-radius * 1.5;
      shield-placement-type: simple;
      shield-placements: 'S,N,E,W';
      /*[dir = 1] {
        shield-placements: 'N,S,E,W';
      }*/
      shield-unlock-image: true;
    }

    [zoom >= 10] {
      text-name: '[name_en]';
      text-face-name: @book-fonts;
      text-fill: @place;
      text-size: 14;
      text-wrap-width: 70; // 5.0 em
      text-line-spacing: -0.7; // -0.05 em
      text-margin: 9.8; // 0.7 em
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
    }
  }

  [kind = "town"] {
    [zoom >= 9] {
      text-name: "[name_en]";
      text-size: 10;
      text-fill: @place;
      text-face-name: @book-fonts;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-wrap-width: 40; // 4.0 em
      text-line-spacing: -1.0; // -0.10 em
      text-margin: 7.0; // 0.7 em
      [zoom >= 12] {
        text-size: 12;
        text-wrap-width: 70; // 5.0 em
        text-line-spacing: -0.7; // -0.05 em
        text-margin: 9.8; // 0.7 em
      }
      [zoom >= 14] {
        text-size: 14;
        text-wrap-width: 75; // 5.0 em
        text-line-spacing: -0.7; // -0.05 em
        text-margin: 10.5; // 0.7 em
      }
    }
  }

  [kind = 'suburb'][zoom >= 12],
  [kind = 'village'][zoom >= 12] {
    text-name: "[name_en]";
    text-size: 10;
    text-fill: @place;
    text-face-name: @book-fonts;
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 50; // 5.0 em
    text-line-spacing: -0.50; // -0.05 em
    text-margin: 7.0; // 0.7 em
    [zoom >= 13] {
      text-size: 11;
      text-wrap-width: 55; // 5.0 em
      text-line-spacing: -0.55; // -0.05 em
      text-margin: 7.7; // 0.7 em
    }
    [zoom >= 14] {
      text-fill: @place-light;
      text-halo-fill: white;
      text-size: 12;
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
    }
    [zoom >= 15] {
      text-size: 13;
      text-wrap-width: 70; // 5.0 em
      text-line-spacing: -0.70; // -0.05 em
      text-margin: 9.8; // 0.7 em
    }
    [zoom >= 16] {
      text-size: 14;
      text-wrap-width: 75; // 5.0 em
      text-line-spacing: -0.75; // -0.05 em
      text-margin: 10.5; // 0.7 em
    }
  }

  [kind = 'hamlet'],
  [kind = 'neighbourhood'],
  [kind = 'isolated_dwelling'],
  [kind = 'farm'] {
    [zoom >= 15] {
      text-name: "[name_en]";
      text-size: 10;
      text-fill: @place;
      text-face-name: @book-fonts;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-wrap-width: 45; // 4.5 em
      text-line-spacing: -0.8; // -0.08 em
      text-margin: 7.0; // 0.7 em
    }
    [zoom >= 17] {
      text-size: 12;
    }
  }

  [kind = 'island'] {
    [zoom >= 10] {
      text-name: "[name_en]";
      text-size: 12;
      text-fill: @place;
      text-face-name: @oblique-fonts;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-wrap-width: 45; // 4.5 em
      text-line-spacing: -0.8; // -0.08 em
      text-margin: 7.0; // 0.7 em
    }
  }
}
