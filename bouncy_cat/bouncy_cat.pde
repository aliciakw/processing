
float rBody = 130;
float rHead = 32;
float wBody = 130;
float hBody = 100;
float dEye = 8;
float lEar = 30;
float lNose = 10;

void rotateCanvas (float theta) {
  if (theta < 0) {
    rotate(TWO_PI + theta);
  } else {
    rotate(theta);
  }
}

void drawCat() {
  noStroke();
  fill(252, 109, 252); // pink
  //rotateCanvas(-1 * PI/16.0);
  // body
  float x = width / 4;
  float y = height / 4;
  rect(x, y, wBody, hBody, wBody);
  // head
  float xHead = x + 0.78 * wBody;
  float yHead = 1.05 * y;
  ellipse(xHead, yHead, 2 * rHead, 1.8 * rHead);
  //ears
  triangle(
    xHead - .85 * rHead,              yHead - 0.5 * rHead, 
    xHead - .85 * rHead + 0.6 * lEar, yHead - 0.5 * rHead,
    xHead - .85 * rHead + 0.6 * lEar, yHead - 0.5 * rHead - lEar);
  triangle(
    xHead + .85 * rHead,              yHead - 0.5 * rHead, 
    xHead + .85 * rHead - 0.6 * lEar, yHead - 0.5 * rHead,
    xHead + .85 * rHead - 0.6 * lEar, yHead - 0.5 * rHead - lEar);
  
  //tail
  
  
  //eyes
  fill(10);
  ellipse(xHead - dEye, yHead - dEye / 2, dEye, dEye);
  ellipse(xHead + 1.5 * dEye, yHead - dEye / 2, dEye, dEye);
  //nose 
  triangle(
    xHead - 0.4 * lNose, yHead + 0.7 * dEye, 
    xHead + 0.6 * lNose, yHead + 0.7 * dEye,
    xHead + 0.1 * lNose, yHead + 0.7 * dEye + 0.7 * lNose); 
}


void setup() {
  size(700, 500);
  //pixelDensity(2);
};


void draw() {
  background(20);
  delay(100);
  drawCat();
  
}





// old code

//ellipse(x, y, 2.3 * rBody, 2 * rBody);
  //float xHead = x + 0.8 * rBody;
  //float yHead = y - 0.6 * rBody;
