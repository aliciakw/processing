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
      drawGradient((float) x, (float) y);
    } else {
      stroke(255);
      strokeWeight(3);
      noFill();
      point(x, y);
    }
  }
  
  void drawGradient(float x, float y) {
    float h = random(0, 360);
    for (int r = radius; r > 0; --r) {
      fill(h, 90, 90);
      ellipse(x, y, r, r);
      h = (h + 1) % 360;
    }
  }
  
  
}
