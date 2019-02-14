
float rBody = 130;
float rHead = 30;
float wBody = 130;
float hBody = 100;
float dEye = 8;
float lNose = 10;

void drawCat() {
  noStroke();
  fill(252, 109, 252); // pink
  rotate(TWO_PI - PI/16.0);
  
  // body
  float x = width / 4;
  float y = height / 4;
  rect(x, y, wBody, hBody, 2 * wBody);
  // head
  float xHead = x + 0.78 * wBody;
  float yHead = 1.05 * y;
  ellipse(xHead, yHead, 2 * rHead, 2 * rHead);
  //tail
  
  
  //eyes
  fill(10);
  ellipse(xHead - dEye, yHead - dEye / 2, dEye, dEye);
  ellipse(xHead + 1.5 * dEye, yHead - dEye / 2, dEye, dEye);
  //nose 
  triangle(
    xHead - 0.4 * lNose, yHead + dEye, 
    xHead + 0.6 * lNose, yHead + dEye,
    xHead + 0.1 * lNose, yHead + dEye + 0.7 * lNose); 
}


void setup() {
  size(800, 500);
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
