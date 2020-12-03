class InitialGridPosition{
  ArrayList<Cell> list;
  
  InitialGridPosition(){
    this.list = new ArrayList<Cell>();
    for(int i=0; i<nbrCellWidth*nbrCellHeight; i++){
      this.list.add(new Cell(floor(i%nbrCellWidth*cellWidth), floor(floor(i/nbrCellWidth)*cellHeight)));
    }
    for(Cell cell : this.list){
      int xIndex = cell.xIndex;
      int yIndex = cell.yIndex;
      
      int xIndexMinus1 = xIndex - 1;
      int xIndexPlus1 = xIndex + 1;
      int yIndexMinus1 = yIndex - 1;
      int yIndexPlus1 = yIndex + 1;
      
      if(xIndex == 0){
        xIndexMinus1 = nbrCellWidth-1;
      } else if(xIndex == nbrCellWidth-1){
        xIndexPlus1 = 0;
      }
      if(yIndex == 0){
        yIndexMinus1 = nbrCellHeight-1;
      } else if(yIndex == nbrCellHeight-1){
        yIndexPlus1 = 0;
      }
      
      cell.neighbours[0] = this.list.get(this.toMonoIndex(xIndexMinus1, yIndexMinus1));
      cell.neighbours[1] = this.list.get(this.toMonoIndex(xIndex, yIndexMinus1));
      cell.neighbours[2] = this.list.get(this.toMonoIndex(xIndexPlus1, yIndexMinus1));
      cell.neighbours[3] = this.list.get(this.toMonoIndex(xIndexMinus1, yIndex));
      cell.neighbours[4] = this.list.get(this.toMonoIndex(xIndexPlus1, yIndex));
      cell.neighbours[5] = this.list.get(this.toMonoIndex(xIndexMinus1, yIndexPlus1));
      cell.neighbours[6] = this.list.get(this.toMonoIndex(xIndex, yIndexPlus1));
      cell.neighbours[7] = this.list.get(this.toMonoIndex(xIndexPlus1, yIndexPlus1));
    }
  }
  
  void display(){
    for(Cell cell : this.list){
      cell.display();
    }
  }
  
  void toggle(int _x, int _y){
    int x = floor(map(_x, 0, width, 0, nbrCellWidth));
    int y = floor(map(_y, 0, height, 0, nbrCellHeight));
    this.list.get(this.toMonoIndex(x, y)).toggle();
  }
  
  int toMonoIndex(int _x, int _y){
    return _y*nbrCellWidth+_x;
  }
}
