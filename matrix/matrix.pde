Grid matrix;
int spacing = 40;
int n = 9;
int[] frame;

void setup() {
  background(20);
  size(680, 680);
  matrix = new Grid(n, n, spacing, 0.15);
  frame = new int[] { 
    1,0,0, 0,0,0, 0,0,0,
    0,0,0, 0,0,0, 0,0,0,
    0,0,0, 0,0,0, 0,0,0,
    
    0,0,0, 0,0,0, 0,0,0,
    0,0,0, 0,0,0, 0,0,0,
    0,0,0, 0,0,0, 0,0,0,
    
    0,0,0, 0,0,0, 0,0,0,
    0,0,0, 0,0,0, 0,0,0,
    0,0,0, 0,0,0, 0,0,0
  };
  
  matrix.show();
  delay(500);
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
