@aerialway: #ff0000; //#808080;

#aerialways {
  [kind = 'cable_car'],
  [kind = 'gondola'] {
    [zoom >= 12] {
      line/line-width: 1;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: @aerialway;
      
      dash/line-width: 3;
      dash/line-join: round;
      dash/line-cap: round;
      dash/line-color: black;
      dash/line-dasharray: 0.4,13;
      dash/line-clip: false;
    }
  }
  
  [kind = 'goods'] {
    [zoom >= 13] {
      line/line-width: 1;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: @aerialway;
      
      dash/line-width: 3.5;
      dash/line-join: round;
      dash/line-color: #707070;
      dash/line-dasharray: 6,25;
      dash/line-clip: false;
    }
  }
  
  [kind = 'chair_lift'],
  [kind = 'drag_lift'],
  [kind = 't-bar'],
  [kind = 'j-bar'],
  [kind = 'platter'],
  [kind = 'rope_tow'] {
    [zoom >= 13] {
      line/line-width: 1;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: @aerialway;
      
      dash/line-width: 4;
      dash/line-join: round;
      dash/line-color: black;
      dash/line-dasharray: 1,30;
      dash/line-clip: false;
    }
  }
}
