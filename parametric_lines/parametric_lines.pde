// Parametric Lines (emulating art of John Whitney)
// Tutorial as per https://www.youtube.com/watch?v=LaarVR1AOvs

// Notes about sine waves:
// sin(t * f) * a;
// the coefficient f changes the wave frequency (1 may be too high. try 1/10)
// the coefficient a changes the wave amplitude (1 may be too low. try 50)

// orange stroke(204, 102, 0);
// yellow stroke(255, 255, 204);


static final int NUM_LINES = 20;
float t = 0;
float k;
float x_start(float t, float offset) {
  return cos(t/5) * 100 + offset;
}
float x_end(float t, float offset) {
  return cos(t/5) * 100 + offset;
}

float y_start(float t) {
  return sin(t/40) * 150;
}
float y_end(float t) {
  return sin(t/40) * 150;
}

int stroke_color(float t) {
  int color_max = 255;
  int color_min = 20;
  
  float color_scale = Math.abs(t % 20 - 10);
  return Math.round((color_scale * (color_max - color_min) / 10) + color_min);
}

void setup() {
  background(20);
  strokeWeight(3);
  size(500, 500);
}

void draw() {
  background(20);
  translate(width/2, height/2);
  
  
  for(int i = 0; i < NUM_LINES; i++) {
    k = t + i; 
    stroke(stroke_color(k));
    line(
    x_start(k, -100),
    y_start(-k),
    x_end(k, 100),
    y_end(k)
  );
  }
  
  t+= 0.25;
}
