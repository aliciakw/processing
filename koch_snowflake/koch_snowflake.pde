/* 

   Click to make snowflakes!
   
   https://www.youtube.com/watch?v=X8bXDKqMsXE
   https://en.wikipedia.org/wiki/Koch_snowflake
*/


ArrayList<KochSegment> segments;
int generation = 0;

void addAll(ArrayList<KochSegment> list, KochSegment arr[]) {
  for (KochSegment s : arr) {
    list.add(s);
  }
}

PVector vertexA = new PVector(100, 425);
PVector vertexB = new PVector(500, 425);
PVector vertexC = new PVector(300, 75);
KochSegment side1 = new KochSegment(vertexA, vertexB);
KochSegment side2 = new KochSegment(vertexB, vertexC);
KochSegment side3 = new KochSegment(vertexC, vertexA);

void setup() {
  background(20);
  size(600, 600);
  stroke(255);
  strokeWeight(3);
  fill(20);

  segments = new ArrayList<KochSegment>();
  segments.add(side1);
  segments.add(side2);
  segments.add(side3);
}

void mousePressed() {
  if (generation < 4) {
    ArrayList<KochSegment> nextGeneration = new ArrayList<KochSegment>();
    for (KochSegment s : segments) {
      KochSegment[] children = s.generate(1);
      addAll(nextGeneration, children);
      segments = nextGeneration;
    }
    generation += 1;
  } else {
    generation = 0;
    setup(); 
  }
}

void draw() {
  background(20);
  for (KochSegment segment : segments) {
    segment.show();
  }
}
