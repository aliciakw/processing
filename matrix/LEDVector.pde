class LEDVector {
  int x;
  int y;
  int brightness;
  int radius = 12;
 
  LEDVector(int _x, int _y, int _brightness) {
    x = _x;
    y = _y;
    brightness = _brightness;
  }
  
  void show() {
    if (brightness > 0) {
      colorMode(HSB, 360, 100, 100);
      noStroke();
      ellipseMode(RADIUS);
      drawIlluminatedBulb((float) x, (float) y);
    } else {
      stroke(255);
      strokeWeight(1);
      noFill();
      point(x, y);
    }
  }
  
  void drawIlluminatedBulb(float x, float y) {
    float a = 50;
    for (int r = radius; r > 0; --r) {
      fill(0, 0, 90, a);
      ellipse(x, y, r, r);
      a = (a + 1) % 360;
    }
  }
  
  
}
