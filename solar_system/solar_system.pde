Planet sun;

void setup() {
  size(600,600);
  sun = new Planet();
  sun.spawnMoons(5);
}


void draw() {
  translate(width / 2, height / 2);
  background(20);
  
  sun.show();
  
  
}
