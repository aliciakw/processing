class Grid {
  ArrayList<ArrayList<PVector>> grid;
  PVector _point;
  int spacing = 20;
 
  Grid (int numberOfRows, int numberOfCols, int spaceBetween) {
    spacing = spaceBetween;
    
    grid = new ArrayList(numberOfCols);
    for (int i = 0; i < numberOfRows; i++) {
      ArrayList<PVector> row = new ArrayList(numberOfCols);
      for (int j = 0; j < numberOfCols; j++) {
           _point = new PVector();
           _point.x = (j + 1) * spacing;
           _point.y = (i + 1) * spacing;
           row.add(_point);
      }
      grid.add(row);
    }
  }
  
  void show() {
    stroke(255);
    strokeWeight(3);
    noFill();
    
    for (ArrayList<PVector> row : grid) {
      for (PVector point : row) {
        point(point.x, point.y);
      }
    }  
  }
}
