class Cell{  
  boolean activated;
  int sum;
  int x;
  int y;
  int xIndex;
  int yIndex;
  Cell[] neighbours;
  
  Cell(){
    this.activated = false;
    this.x = 0;
    this.y = 0;
    this.xIndex = 0;
    this.yIndex = 0;
    
    this.neighbours = new Cell[4];
    this.neighbours[0] = null;
    this.neighbours[1] = null;
    this.neighbours[2] = null;
    this.neighbours[3] = null;
  }
  
  Cell(int _x, int _y){
    this.activated = false;
    this.x = _x;
    this.y = _y;
    this.xIndex = floor(this.x/cellWidth);
    this.yIndex = floor(this.y/cellHeight);
    
    this.neighbours = new Cell[8];
    this.neighbours[0] = null;
    this.neighbours[1] = null;
    this.neighbours[2] = null;
    this.neighbours[3] = null;
    this.neighbours[4] = null;
    this.neighbours[5] = null;
    this.neighbours[6] = null;
    this.neighbours[7] = null;
  }
  
  void actualize(){
    if(this.activated){
      if(sum <= minToDie || sum >= maxToDie){
        this.activated = false;
      }
    } else {
      if(sum == toLive){
        this.activated = true;
      }
    }
  }
  
  void display(){
    if(this.activated){
      fill(125);
      
    } else {
      fill(0);
    }
    stroke(255);
    rect(x, y, cellWidth, cellHeight);
  }
  
  void setNeighbour(int _i, Cell _c){
    this.neighbours[_i] = _c;
  }
  
  void toggle(){
    this.activated = !this.activated;
  }
  
  void update(){
    this.sum = 0;
    for(Cell cell : this.neighbours){
      if(cell.activated){
        this.sum ++;
      }
    }
  }
}
