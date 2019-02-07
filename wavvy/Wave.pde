class Wave {
  int xspacing = 30;   // How far apart should each horizontal location be spaced
  int w;              // Width of entire wave

  float theta = 0.0;  // Start angle at 0
  float amplitude = 75.0;  // Height of wave
  float period = 500.0;  // How many pixels before the wave repeats
  float angularVelocity = 0.02; 
  float dx;  // Value for incrementing X, a function of period and xspacing
  float[] yvalues;  // Using an array to store height values for the wave
  float r = 16;

  
  Wave(float _period, float _amplitude,  float _angularVelocity, float _r) {
    period = _period;
    amplitude = _amplitude;
    angularVelocity = _angularVelocity;
    r = _r;
    
    w = width+16;
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
  }
  
  Wave() {    
    w = width+16;
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
  }
  
  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += angularVelocity;
  
    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = cos(x)* -1 * amplitude;
      x+=dx;
    }
  }

  void renderWave() {
    
    // A simple way to draw the wave with an ellipse at each location
    for (int x = 0; x < yvalues.length; x++) {
      drawElement(0, x*xspacing, height/2+yvalues[x], r, r);
    }
  }
  
  void drawElement(int _type, float x1, float y1, float x2, float y2) {
    switch(_type) {
      case 0: 
      default:
        // White Circles
        noStroke();
        fill(255); 
        ellipse(x1, y1, x2, y2);
        break;
    }
 
  }
  

}
