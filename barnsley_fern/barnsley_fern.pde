/* Tutorial: https://youtu.be/JFugGF1URNo
   Formula: https://en.wikipedia.org/wiki/Barnsley_fern
*/

float x = 0;
float y = 0;
float px;
float py;

void drawPoint() {
  px = map(x, -4, 4, 0, width); 
  py = map(y, 0, 8, height, 0); 
  point(px,py);
}

void nextPoint() {
  float nextX;
  float nextY;
  float permutation = random(1);
  
  if (permutation < 0.1) {
    nextX =  0;
    nextY =  0.16 * y;
  } else if (permutation < 0.86) {
    nextX =  0.85 * x +  0.04 * y;
    nextY = -0.04 * x +  0.85 * y + 1.6;
  } else if (permutation < 0.93) {
    nextX =  0.20 * x + -0.26 * y;
    nextY =  0.23 * x +  0.22 * y + 1.6;
  } else {
    nextX = -0.15 * x +  0.28 * y;
    nextY =  0.26 * x +  0.24 * y + 0.44;
  }
  
  x = nextX;
  y = nextY;
  
}

void setup() {
  size(600, 600);
  background(20);
  strokeWeight(2);
  stroke(170, 255, 172);
}

void draw() {
  for (int i = 0; i < 100; i++) {
    drawPoint();
    nextPoint(); 
  }
}
