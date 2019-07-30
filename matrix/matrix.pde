Grid matrix;
int spacing = 40;
int n = 16;

void setup() {
  background(20);
  size(680, 680);
  matrix = new Grid(n, n, spacing, 0.15);
  matrix.show();
}

void draw() {
  background(20);
  matrix.updateBrightness();
  matrix.show();
  delay(500);
}
