@building-fill: #E4E0E0;			
@building-line: darken(@building-fill, 15%);
@building-low-zoom: darken(@building-fill, 4%);


#buildings {
  [zoom >= 13] {
    polygon-fill: @building-low-zoom;
    polygon-clip: false;
    [zoom >= 16] {
      line-color: @building-line;
      polygon-fill: @building-fill;
      line-width: .5;
      line-clip: false;
    }
  }
}


#bridge {
  [zoom >= 12] {
    polygon-fill: #ff0000; // #B8B8B8;
  }
}



/* Features related to (postal) adresses: */

@address-color: #666;

#addresses {
  [zoom >= 17] {
    text-name: "[name]";
    ["number" != null] {
      text-name: [number];
      ["name" != null] {
        text-name: [number] + "\n" + [name];
      }
    }
    text-placement: interior;
    text-min-distance: 1;
    text-wrap-width: 20;
    text-face-name: @book-fonts;
    text-fill: @address-color;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-size: 10;
    [zoom >= 20] {
      text-size: 11;
    }
  }
}
