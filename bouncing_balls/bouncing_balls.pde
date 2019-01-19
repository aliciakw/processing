void setup() {
  background(20);
  stroke(255);
  fill(0);
  strokeWeight(3);
  size(1000, 500);
}

static final int initialY = 50;
int translateY = 60;
float direction = 2.75;

int[] cols = { 150, 250, 350, 450, 550, 650, 750, 850 };
int laps = 0;

void circle (int x, int r) {
  ellipse(x, initialY + translateY, r, r);
}

void changePalette() {
}

void changeLap(int max) {
  //System.out.println("LAP " + laps);
  laps += 1;
  if (laps == max) {
    background(20);
    laps = 0;
  }
}

void bouncingCircles() {
  for (int i = 0; i < cols.length; i++) {
    circle(cols[i], 50);
  }

  if (translateY <= 60 && direction < 0) {
    direction = 2.75;
    changeLap(1);
  } else if (translateY >= 340 && direction > 0) {
    direction = -1.5;
  }
  // translate
  translateY += direction;
  
  if (laps == 8) {
    return;
  }
}

void draw() {
  
  bouncingCircles();
}
