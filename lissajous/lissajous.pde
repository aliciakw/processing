/*
   Lissajous curves are a visualization of a point traveling around two imaginary
 circles - one representing the X coordinate and one representing the Y.
 The speed at which the point travels around the X-coordinate circle and 
 the y-coordinate circle is adjusted, causing the generated "loop" to 
 become convoluted. If the points travel at the same speed, we get a circle.
 
 Tutorial: https://www.youtube.com/watch?v=--6eyLO78CY
 
 To convert polar coordinates to cartesian:
 x = r * cos(theta)
 y = r * sin(theta)
 */
float angle = 0;
int gridUnit = 80;
int d = gridUnit - 10;
int r = d / 2;
int cols;
int rows;

void setup() {
  size(600, 600);
  background(20);
  stroke(255);

  noFill();

  cols = width / gridUnit - 1;
  rows = cols;
}

void draw() {
  background(20);
  for (int i = 1; i < cols; i++) {
    renderColumns(i);
    renderRows(i);
  }

  angle += 0.01;
}


void renderColumns(int i) {
  // draw circle
  float cx = (i + 1) * gridUnit; 
  float cy = gridUnit; 
  stroke(30, 95, 255);
  strokeWeight(1);
  ellipse(cx, cy, d, d);

  // draw orbiting point
  float px = r * cos(i * angle - HALF_PI); 
  float py = r * sin(i * angle - HALF_PI );
  strokeWeight(8);
  point(cx + px, cy + py);
    
  // highlight extrapolated x coord
  stroke(30, 95, 255, 150);
  strokeWeight(1);
  line(cx + px, 0, cx + px, height);
}

void renderRows(int i) {
  // draw circle
  float cx = gridUnit; 
  float cy = (i + 1) * gridUnit; 
  stroke(214, 90, 255, 150);
  strokeWeight(1);
  ellipse(cx, cy, d, d);

  // draw orbiting point
  float px = r * cos(i * angle - HALF_PI); 
  float py = r * sin(i * angle - HALF_PI );
  strokeWeight(8);
  point(cx + px, cy + py);
    
  // highlight extrapolated y coord
  stroke(214, 90, 255, 80);
  strokeWeight(1);
  line(0, cy + py, width, cy + py);
}
