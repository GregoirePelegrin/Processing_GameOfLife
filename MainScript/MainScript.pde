boolean initialState;
int count;
int nbrCellWidth;
int nbrCellHeight;
float cellWidth;
float cellHeight;
InitialGridPosition initialGrid;
Grid grid;

int minToDie;
int maxToDie;
int toLive;

void setup(){
  size(750, 750);
  frameRate(30);
  background(0);  
  
  initialState = true;
  count = 0;
  nbrCellWidth = 50;
  nbrCellHeight = nbrCellWidth;
  cellWidth = width/nbrCellWidth;
  cellHeight = height/nbrCellHeight;
  initialGrid = new InitialGridPosition();
  
  minToDie = 1;
  maxToDie = 4;
  toLive = 3;
}

void draw(){
  if(initialState){
    initialGrid.display();
  } else {
    if(count % 1 == 0){
      grid.update();
    }
    grid.display();
    count ++;
  }
}

void mouseClicked(){
  if(initialState){
    initialGrid.toggle(mouseX, mouseY);
  }
}

void keyPressed(){
  if(initialState){
    initialState = false;
    grid = new Grid(initialGrid);
  }
}
