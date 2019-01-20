class Cell {
  float r;
  float maxR = 200;
  int fillColor;
  PVector position;
  float healthMultiplier = random(0, 1);
  
  Cell (PVector positionOverride, float rOverride, int fillColorOverride) {
    position = positionOverride;
    r = rOverride;
    fillColor = fillColorOverride;
  }
  
  Cell() {
    r = random(25, maxR - 25);
    fillColor = color(random(10,255), 0 , random(10,255), 200);
    position = new PVector(
      random(75, width - 75),
      random(75, height - 75)
    );
  }
  
  void move() {
    PVector velocity = PVector.random2D().mult(2);
    position.add(velocity);
  }
  
  void grow() {
    if (r <= maxR) {
      r = r + (.1 * healthMultiplier * r / maxR);
    }
  }
  
  void show() {
    noStroke();
    fill(fillColor);
    ellipse(position.x, position.y, r, r);
  }
  
  boolean clicked(int mousePosX, int mousePosY) {
    float d = dist(position.x, position.y, mousePosX, mousePosY);
    return d < r;
  }
  
  
  Cell mitosis() {
    r = r/2;
    float energyBurst = random(-1 * r, r);
    position.x += energyBurst;
    PVector newPosition = new PVector(position.x - energyBurst, this.position.y);
    return new Cell(newPosition, r, fillColor);
  }
}
