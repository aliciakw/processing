float x;
float y;
float side = 50;
float angle = 0.01;
boolean rotated;
float t;

void setup() {
  size(600, 600);
  stroke(255);
  strokeWeight(2);
  noFill();
  x = width - 2 * side;
  y = 0;
}

void old() {
  rotated = false;
  
  if (y + side / 2 < height / 2) {
    y = y + 1;
  } else {
    if (x > side) {
      x = x - 1;
      // THIS IS NOT WORKING -- need to figure out the right geometry
      // to rotate w/o rotating whole canvas
      rotate(TWO_PI - angle);
      rotated = true;
    } else if (y <= height) {
      y = y + 1;
    }
  }
  square(x, y, side);
  
  if (rotated) {
    angle = angle + angle;
    rotate(angle);
  }
}

void makeSquare(float x, float y, float angle) {
  
  
}



void draw() {
  boolean rotated = false;
  background(20);

  
}
