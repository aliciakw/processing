Grid matrix;
int spacing = 50;
int n = 10;
int[] frame;
int OFF = color(10,10,10);

void setup() {
  colorMode(RGB, 255);
  noStroke();
  ellipseMode(RADIUS);
  background(20);
  size(650, 650);
  matrix = new Grid(n, n, spacing, 0.15);
  readFrameFromCSV("output1.csv");
  
  matrix.show();
  matrix.updateBrightness(frame);
  matrix.show();
}


/* CSV Format
 * id,r,g,b
 */
void readFrameFromCSV(String filename) {
  color[] _frame = new color[n * n];
  Table table = loadTable(filename, "header");
  for (TableRow row : table.rows()) {

    int _id = row.getInt("id");
    int _r = row.getInt("r");
    int _g = row.getInt("g");
    int _b = row.getInt("b");
    println(String.format("id: %s, r: %s, g: %s, b: %s", _id, _r, _g, _b));

    frame[_id] = color(_r,_g,_b);
  }
  frame = _frame;
}

void renderFrameWithDot() {
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
  //frame = shiftRightLinear(frame);
  //matrix.updateBrightness(frame);
  matrix.show();
  delay(500);
}
