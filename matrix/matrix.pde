Grid matrix;
int spacing = 40;
int n = 16;

void setup() {
  background(20);
  size(680, 680);
  matrix = new Grid(n, n, spacing);
}

void draw() {
  background(20);
  matrix.show();
}
