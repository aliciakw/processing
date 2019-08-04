class Grid {
  LEDVector[][] grid;
  LEDVector[] _row;
  LEDVector _point;

  int rows;
  int cols;
  int spacing = 20;
  float illumination = 0.15;
 
  Grid (int _rows, int _cols, int _spacing, float _illumination) {
    rows = _rows;
    cols = _cols;
    spacing = _spacing;
    illumination = _illumination;
    
    grid = new LEDVector[_cols][];
    for (int i = 0; i < _rows; i++) {
      _row = new LEDVector[_cols];
      for (int j = 0; j < _cols; j++) {
        _point = new LEDVector((j + 2) * spacing, (i + 2) * spacing, color(0,0,0));
        _row[j] = _point;
      }
      grid[i] = _row;
    }
  }
  
  void turnOffScreen() {
    for (LEDVector[] row : grid) {
      for (LEDVector led : row) {
        led.fillColor = color(0,0,0);
      }
    }
  }
  
  void updateBrightness() {
    for (LEDVector[] row : grid) {
      for (LEDVector led : row) {
        boolean isOn = random(0, 1) < illumination;
        if (isOn) {
          led.fillColor = color(random(10,255), random(10,255), random(10,255), 200);
        } else {
          led.fillColor = color(0,0,0);
        }   
      }
    }
  }
    

  void updateBrightness(color[] frame) {
    try {
      if (frame.length != rows * cols) {
        throw new Exception(String.format("Invalid frame! Expected %s pixels, but got %s.", rows * cols, frame.length ));
      }
      int _x;
      int _y;
      for (int i = 0; i < frame.length; i++) {
        _x = i % cols;
        _y = floor(i / rows);
        grid[_y][_x].fillColor = frame[i];
      }  
    } catch (Exception e) {
      printStackTrace(e);
      turnOffScreen();
    }
  }
  
  void show() {
    for (LEDVector[] row : grid) {
      for (LEDVector point : row) {
        point.show();
      }
    }  
  }
}
