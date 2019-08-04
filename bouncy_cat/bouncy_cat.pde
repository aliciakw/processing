float x = width / 3;
float y = height / 2;
float rBody = 130;
float rHead = 32;
float wBody = 130;
float hBody = 100;
float dEye = 8;
float lEar = 30;
float lNose = 10;
ArrayList<PVector> path;

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
  rect(x, y, wBody, hBody, wBody);
  //tail
  
  // head
  float xHead = x + 0.78 * wBody;
  float yHead = 1.25 * y;
  ellipse(xHead, yHead, 2 * rHead, 1.8 * rHead);
  //ears
  triangle(
    xHead - .85 * rHead, yHead - 0.5 * rHead, 
    xHead - .85 * rHead + 0.6 * lEar, yHead - 0.5 * rHead, 
    xHead - .85 * rHead + 0.6 * lEar, yHead - 0.5 * rHead - lEar);
  triangle(
    xHead + .85 * rHead, yHead - 0.5 * rHead, 
    xHead + .85 * rHead - 0.6 * lEar, yHead - 0.5 * rHead, 
    xHead + .85 * rHead - 0.6 * lEar, yHead - 0.5 * rHead - lEar);
  //eyes
  fill(10);
  ellipse(xHead - dEye, yHead - dEye / 2, dEye, dEye);
  ellipse(xHead + 1.5 * dEye, yHead - dEye / 2, dEye, dEye);
  //nose 
  triangle(
    xHead - 0.4 * lNose, yHead + 0.7 * dEye, 
    xHead + 0.6 * lNose, yHead + 0.7 * dEye, 
    xHead + 0.1 * lNose, yHead + 0.7 * dEye + 0.7 * lNose); 
  //whiskers
  stroke(10);
  strokeWeight(1);
  line(xHead + lNose, yHead + 0.9 * dEye, 
    xHead + 2 * lNose, yHead + 0.6 * dEye);
  line(xHead + lNose, yHead + 1.3 * dEye, 
    xHead + 2 * lNose, yHead + 1.05 * dEye);
  line(xHead - lNose, yHead + 0.9 * dEye, 
    xHead - 2 * lNose, yHead + 0.6 * dEye);
  line(xHead - lNose, yHead + 1.3 * dEye, 
    xHead - 2 * lNose, yHead + 1.05 * dEye);
  //feet
  float rLeg = wBody / 5;
  noFill();
  strokeWeight(2);
  arc(x + 0.25 * wBody,              y + 0.50 * hBody, rLeg, rLeg, 0, PI);
  arc(x + 0.25 * wBody + 1.5 * rLeg, y + 0.50 * hBody, rLeg, rLeg, 0, PI);
  arc(x + 0.35 * wBody,              y + 0.75 * hBody, rLeg, rLeg, 0, PI);
  arc(x + 0.35 * wBody + 1.5 * rLeg, y + 0.75 * hBody, rLeg, rLeg, 0, PI);
}


void setup() {
  size(700, 500);
  //pixelDensity(2);
};

void moveCat () {
  x += 0.1;
  y += 0.05;
}

void plotCurve(float initialX) {
  path = new ArrayList<PVector>();
  float posX = initialX;
  PVector _point;
  boolean keepPlotting = true;
  float m = 0.03;
  float translation = 50;

  while(keepPlotting) {
    y = m * posX * posX + 50;
    _point = new PVector();
    _point.x = posX + translation;
    _point.y = y;
    path.add(_point);
    
    if (y < height - translation) {
      posX += 1; 
    } else {
      keepPlotting = false;
    }
  }
}

void showCurve() {
  noFill();
  stroke(255);
  beginShape();
  for (PVector v : path) {
    vertex(v.x, v.y);
  }
  endShape();
}

void drawPath() {
  noFill();
  stroke(255);
  float offset = 50;
  float pathHeight = 1.75 * (height - offset);
  float pathWidthUnit = width / 5;
  arc(offset, (pathHeight / 2) + offset, pathWidthUnit, pathHeight, 3 * PI / 2, TWO_PI);
  arc(1.25 * pathWidthUnit + offset, pathHeight / 2 + offset, 1.5 * pathWidthUnit, pathHeight, PI, TWO_PI);
  arc(3.125 * pathWidthUnit + offset, pathHeight / 2 + offset, 2.25 * pathWidthUnit, 0.75 * pathHeight, PI, TWO_PI);
}


void draw() {
  background(20);
  drawCat();
  moveCat();
  //drawPath();
  //plotCurve(0);
  //showCurve();
}





// old code

//ellipse(x, y, 2.3 * rBody, 2 * rBody);
//float xHead = x + 0.8 * rBody;
//float yHead = y - 0.6 * rBody;
