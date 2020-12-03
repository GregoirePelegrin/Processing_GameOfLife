class Grid{
  InitialGridPosition iGrid;
  ArrayList<Cell> list;
  
  Grid(InitialGridPosition _iGrid){
    this.iGrid = _iGrid;
    this.copyList();
  }
  
  void copyList(){
    this.list = new ArrayList<Cell>();
    for(Cell cell : this.iGrid.list){
      this.list.add(cell);
    }
  }
  
  void display(){
    background(0);
    for(Cell cell : this.list){
      cell.actualize();
      cell.display();
    }
  }
  
  void update(){
    for(Cell cell : this.list){
      cell.update();
    }
  }
}
