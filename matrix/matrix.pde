Grid matrix;
int spacing = 50;
int n = 10;
int[] frame;
int OFF = color(0,0,0);

void setup() {
  colorMode(RGB);
  noStroke();
  ellipseMode(RADIUS);
  background(20);
  size(650, 650);
  matrix = new Grid(n, n, spacing, 0.15);
  frame = new color[] { 
    color(50, 168, 82),  OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,
    OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,
    OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,
    OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,
    OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,
    OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,
    OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,
    OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,
    OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,
    OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF,OFF
  };
  
  matrix.show();
  matrix.updateBrightness(frame);
  matrix.show();
}

int[] shiftRightLinear(int[] frame) {
  int[] newFrame = new int[frame.length];
  for (int i = 0; i < frame.length; i++) {
    if (i == 0) {
      newFrame[i] = frame[frame.length - 1];
    } else {
      newFrame[i] = frame[i - 1];
    }
  }
  return newFrame;
}

void draw() {
  background(20);
  frame = shiftRightLinear(frame);
  matrix.updateBrightness(frame);
  matrix.show();
  delay(500);
}
