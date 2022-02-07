/* Colour definitions for Basic Color style */
/* Basic Defintions */
@land: #f4f3e6; 
@standard-halo-fill: rgba(255,255,255,0.6);

/* Administrative */
@admin-boundaries: #663300;
@state: desaturate(darken(@admin-boundaries, 5%), 20%);
@country: darken(@admin-boundaries, 5%);
@place: #555;
@place-light: #888;

/* Aerialways */
@aerialway: #808080;

/* Addresses */
@address-color: #666;

/* Buildings */
@building-fill: #E4E0E0;			
@building-line: darken(@building-fill, 15%);
@building-low-zoom: darken(@building-fill, 4%);

/* Land */
@forest:    #D3E3C3; 
@grass:     #E4EEDA;
@cemetery:  #D6DED2;
@quarry:    #DDDCD8;
@builtup:   #ECEAE1;
@farmland:    @land;            
@beach:        #fff1ba;
@pier:        @land;
@societal:  #FFF5CC;

/* Roads */
/* copied from generated colors */

@motorway-low-zoom-casing: #c24e6b;
@trunk-low-zoom-casing: #cf6649;
@primary-low-zoom-casing: #c38a27;
@secondary-low-zoom-casing: darken(#FFE873,40%);

@motorway-casing: #dc2a67;
@trunk-casing: #c84e2f;
@primary-casing: #a06b00;
@secondary-casing: darken(#FFE873,40%);

@motorway-low-zoom: #e66e89;
@trunk-low-zoom: #f5977a;
@primary-low-zoom: #f3c380;
@secondary-low-zoom: darken(#FFE873,20%);

@motorway-fill: #e892a2;
@trunk-fill: #f9b29c;
@primary-fill: #fcd6a4;
@secondary-fill: lighten(#FFE873,10%);


@motorway-shield: #620728;
@trunk-shield: #5d1b0b;
@primary-shield: #4c2e00;
@secondary-shield: #323b00;

@platform-color: grey;
@platform-fill-color: #bbbbbb;


/* For the main linear features, such as roads and railways. */

@tertiary-fill: #ffffff;
@residential-fill: #ffffff;
@service-fill: @residential-fill;
@living-street-fill: #ffffff;
@pedestrian-fill: #ffffff;
@raceway-fill: #ffffff;
@road-fill: #ffffff;
@footway-fill: #ffffff;
@footway-fill-noaccess: #ffffff;
@steps-fill: @footway-fill;
@steps-fill-noaccess: #ffffff;
@cycleway-fill: #fff; // blue;
@cycleway-fill-noaccess: #ffffff;
@bridleway-fill: @track-fill;
@bridleway-fill-noaccess: #ffffff;
@track-fill: darken(@residential-fill, 20%);
@track-fill-noaccess: #ffffff;
@aeroway-fill: #bbc;
@runway-fill: @aeroway-fill;
@taxiway-fill: @aeroway-fill;
@helipad-fill: @aeroway-fill;
@rail-fill: #ababab;
@access-marking: #eaeaea;
@access-marking-living-street: #cccccc;

@default-casing: white;
@tertiary-casing: #8f8f8f;
@residential-casing: #bbb;
@road-casing: @residential-casing;
@service-casing: @residential-casing;
@living-street-casing: @residential-casing;
@pedestrian-casing: #999;
@path-casing: @default-casing;
@footway-casing: @default-casing;
@steps-casing: @default-casing;
@cycleway-casing: @default-casing;
@bridleway-casing: @default-casing;
@track-casing: @default-casing;

@tertiary-shield: #3b3b3b;

@unimportant-road: @residential-casing;

@residential-construction: #aaa;
@service-construction: #aaa;

@destination-marking: #c2e0ff;
@private-marking: #efa9a9;
@private-marking-for-red: #C26363;

@tunnel-casing: grey;
@bridge-casing: #444;

@motorway-tunnel-fill: lighten(@motorway-fill, 10%);
@trunk-tunnel-fill: lighten(@trunk-fill, 10%);
@primary-tunnel-fill: lighten(@primary-fill, 10%);
@secondary-tunnel-fill: lighten(@secondary-fill, 5%);
@tertiary-tunnel-fill: lighten(@tertiary-fill, 5%);
@residential-tunnel-fill: darken(@residential-fill, 5%);
@living-street-tunnel-fill: lighten(@living-street-fill, 10%);

@junction-text-color:             #960000;
@halo-color-for-minor-road: white;

@motorway-oneway-arrow-color:     darken(@motorway-casing, 25%);
@trunk-oneway-arrow-color:        darken(@trunk-casing, 25%);
@primary-oneway-arrow-color:      darken(@primary-casing, 15%);
@secondary-oneway-arrow-color:    darken(@secondary-casing, 10%);
@tertiary-oneway-arrow-color:     darken(@tertiary-casing, 30%);
@residential-oneway-arrow-color:  darken(@residential-casing, 30%);
@living-street-oneway-arrow-color: darken(@residential-casing, 30%);
@pedestrian-oneway-arrow-color:   darken(@pedestrian-casing, 25%);
@raceway-oneway-arrow-color:      darken(@raceway-fill, 40%);
@footway-oneway-arrow-color:      darken(@footway-fill, 30%);
@steps-oneway-arrow-color:        darken(@steps-fill, 30%);
@cycleway-oneway-arrow-color:     darken(@cycleway-fill, 20%);
@track-oneway-arrow-color:        darken(@track-fill, 15%);
@bridleway-oneway-arrow-color:    darken(@track-fill, 10%);

/* Stations */
@station-color: #7981b0;
@station-text: darken(saturate(@station-color, 15%), 10%);
@aerodrome-color: #555;

/* Water Features */
@breakwater-color: #aaa; /* Also for groyne */
@dam: #adadad;
@dam-line: #aaa;
@weir-line: #aaa;
@lock-gate: #aaa;
@lock-gate-line: #aaa;
@marina-color: blue;

/* Water */
@water:      #c4dff6;
@glacier:    #EFF6FD;
@glacier-line: @water;
@water-text:  #6699cc;
