Planet sun;

void setup() {
  size(600,600);
  sun = new Planet();
  sun.spawnMoons(5);
}


void draw() {
  background(20);
  translate(width / 2, height / 2);
  sun.show(sun.originX, sun.originY);
  
}
