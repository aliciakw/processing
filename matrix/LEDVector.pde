class LEDVector {
  int x;
  int y;
  color fillColor;
  int radius = 12;
 
  LEDVector(int _x, int _y, color _fillColor) {
    x = _x;
    y = _y;
    fillColor = _fillColor;
  }
  
  void show() {
    drawIlluminatedBulb((float) x, (float) y);
  }
  
  void drawIlluminatedBulb(float x, float y) {
    float a = 50;
    for (int r = radius; r > 0; --r) {
      fill(fillColor);
      ellipse(x, y, r, r);
      a = (a + 1) % 360;
    }
  }
  
  
}
