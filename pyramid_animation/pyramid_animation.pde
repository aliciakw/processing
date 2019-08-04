void setup() {
  size(700, 500);
  background(109, 122, 138);
  noStroke();
}

void mintGreen() {
  fill(153, 255, 153);
}
void lemonYellow() {
  fill(220, 240, 11);
}
float sideLength = 25;
float x1 = 0;
float y1 = 0;
float x2 = random(0, width);
float y2 = 0;
float xSpeed = 0.75;
float ySpeed = 0.55;
float G = 1.1;


void drawPyramid() {
  // plot
  mintGreen();
  triangle(
    x1, y1,
    x1 + sideLength / 2, y1 - sideLength,
    x1 + sideLength, y1);
  
  // update
  x1 = x1 + xSpeed;
  y1 = y1 + ySpeed * G;
  if (x1 > width) {
    x1 =  -1.5 * sideLength;
  }
  if (y1 > height) {
    y1 = -1.5 * sideLength;
  }
}

void drawVerticalStripe() {
  // plot
  lemonYellow();
  square(x2, y2, sideLength);
  
  // move
  y2 += ySpeed;
  
  if (y2 > height) {
    y2 = 0 - sideLength;
    x2 = x2 + 1.5 * sideLength;
  }
  
}



void draw() {
  //background(165, 175, 185);
  drawPyramid();
  drawVerticalStripe();
  
}
