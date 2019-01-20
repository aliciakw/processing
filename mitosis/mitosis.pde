ArrayList<Cell> cells = new ArrayList<Cell>();

void setup() {
  size(700, 500);
  fill(255);
  Cell cell1 = new Cell();
  Cell cell2 = new Cell();
  Cell cell3 = new Cell();
  cells.add(cell1);
  cells.add(cell2);
  cells.add(cell3);
}

void draw() {
  ArrayList<Cell> newCells = new ArrayList<Cell>();

  background(20);
  for (Cell cell : cells) {
    cell.move();
    cell.grow();
    cell.show();
    if (cell.r >= cell.maxR){
      Cell newCell = cell.mitosis();
      newCells.add(newCell);
    }
  }
  
  // Note: this is a separate step because one cannot
  // modify arraylist while you are iterating thru it
  for (Cell newCell : newCells) {
    cells.add(newCell);
  }
}

void mousePressed() {
  ArrayList<Cell> newCells = new ArrayList<Cell>();
  for (Cell cell : cells) {
    if (cell.clicked(mouseX, mouseY)) {
      Cell newCell = cell.mitosis();
      newCells.add(newCell);
    }
  }

  // Note: this is a separate step because one cannot
  // modify arraylist while you are iterating thru it
  for (Cell newCell : newCells) {
    cells.add(newCell);
  }
}
