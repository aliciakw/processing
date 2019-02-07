class Curve {
  ArrayList<PVector> path;
  PVector _point;

  Curve() {
    path = new ArrayList<PVector>();
    _point = new PVector();
  }

  void setX(float x) {
    _point.x = x;
  }
  void setY(float y) {
    _point.y = y;
  }
  void addPoint() {
    path.add(_point);
    _point = new PVector();
  }

  void show() {
    stroke(255);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector v : path) {
      vertex(v.x, v.y);
    }
    endShape();
  }
}
