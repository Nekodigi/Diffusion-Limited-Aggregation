class Walker{
  PVector pos;
  float r;
  boolean stuck;
  int lifetime;
  Walker(float r){
    this(r, randomPoint());
  }
  
  Walker(float r, PVector pos){
    this.pos = pos;
    this.r = r;
    stuck = false;
    lifetime = 0;
  }
  
  boolean checkStuck(){
    int col = toCol(pos.x);
    int row = toRow(pos.y);
    if(isEnableSelector(col, row)){
      for(int i = -1; i <= 1; i++){
        for(int j = -1; j <= 1; j++){
          Cell cell = treeRev[col+i][row+j];
          for(Walker branch : cell.walkers){
            float d = distSq(pos, branch.pos);
            if(d < (r + branch.r) * (r + branch.r)){
              stuck = true;
              return true;
            }
          }
        }
      }
    }
    return false;
  }
  
  void walk(){
    //pos.add(PVector.random2D());//too slow
    pos.add(new PVector(random(-speed, speed), random(-speed, speed)));
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
    lifetime++;
  }
  
  void show(){
    rect(pos.x-r, pos.y-r, r*2, r*2);
  }
}

class Cell{
  ArrayList<Walker> walkers = new ArrayList<Walker>();
}