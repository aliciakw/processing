class Grid {
  ArrayList<ArrayList<LEDVector>> grid;
  LEDVector _point;
  ArrayList<LEDVector> _row;
  int spacing = 20;
  float illumination = 0.15;
 
  Grid (int numberOfRows, int numberOfCols, int _spacing, float _illumination) {
    spacing = _spacing;
    illumination = _illumination;
    
    grid = new ArrayList(numberOfCols);
    for (int i = 0; i < numberOfRows; i++) {
      _row = new ArrayList(numberOfCols);
      for (int j = 0; j < numberOfCols; j++) {
        _point = new LEDVector((j + 1) * spacing, (i + 1) * spacing, 0);
        _row.add(_point);
      }
      grid.add(_row);
    }
  }
  
  void updateBrightness() {
    for (ArrayList<LEDVector> row : grid) {
      for (LEDVector led : row) {
        boolean isOn = random(0, 1) < illumination;
        led.brightness = isOn ? 1 : 0;
      }
    }
  }
  
  void show() {
    for (ArrayList<LEDVector> row : grid) {
      for (LEDVector point : row) {
        point.show();
      }
    }  
  }
}
