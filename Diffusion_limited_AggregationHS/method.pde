void reset(){
  walkers = new ArrayList<Walker>();
  tree = new ArrayList<Walker>();
  treeMin = new PVector(width, height);
  treeMax = new PVector(0, 0);
  treeRev = new Cell[cols][rows];
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
     treeRev[i][j] = new Cell();
    }
  }
}