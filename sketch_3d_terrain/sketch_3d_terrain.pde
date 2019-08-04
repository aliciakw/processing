/*
  https://www.youtube.com/watch?v=IKB1hWWedMk&list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH&index=14
*/
int scl = 50; // pixels
int gridWidth = 1800;
int gridHeight = 1800;
int cols = gridWidth / scl;
int rows = gridHeight / scl;

boolean THREE_D_MODE = true;

void setup() {
  stroke(255);
  strokeWeight(1);
  noFill();
  size(1200, 600, P3D);
  frameRate(5);
}

void draw() {
  background(20);
  translate(0.5 * width, 0.5 * height);
  if (THREE_D_MODE) {
    rotateX(PI / 3);
  }
  
  translate(-0.75 * width , -0.5 * height);

  for (int y = 0; y < rows; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x * scl, y * scl, random(-50, 50));
      vertex(x * scl, (y + 1) * scl, random(-10, 10));
    }
    endShape();
  }
  
}
