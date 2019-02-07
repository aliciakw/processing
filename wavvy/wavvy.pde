Wave wave1; 
Wave wave2;

void setup() {
  size(800, 600);
  background(20);
  wave1 = new Wave(250, 75, 0.02, 16);
  wave2 = new Wave(500, 125, 0.06, 8);
}




void draw(){
  background(20);
  wave1.calcWave();
  wave1.renderWave();
  wave2.calcWave();
  wave2.renderWave();
}
