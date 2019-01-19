class Drop {
  float x = random(width);
  float y = random(-200, 200);
  float z = random(10, 20);
  float yspeed = map(z, 0, 20, 1, 10);
  float dropHeight = map(z, 0, 20, 2, 20);
  float G = 0.03;
  float thickness = map(z, 0, 20, 0.75, 1.25);
 
  
  void fall() {
    y = y + yspeed;
    yspeed = yspeed + (yspeed * G);
 
    if (y > height) {
      y = random(-200, 0);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }
  
  void show() {
    stroke(138, 43, 226);
    
    strokeWeight(thickness);
    line(x, y, x, y + dropHeight);
  }
}
