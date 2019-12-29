class Walker{
  PVector pos;
  float r;
  boolean stuck;
  Walker(float r){
    this(r, randomPoint());
  }
  
  Walker(float r, PVector pos){
    this.pos = pos;
    this.r = r;
    stuck = false;
  }
  
  boolean checkStuck(ArrayList<Walker> others){
    for(Walker other : others){
      float d = distSq(pos, other.pos);
      if(d < (r + other.r) * (r + other.r)){
        stuck = true;
        return true;
      }
    }
    return false;
  }
  
  void walk(){
    pos.add(PVector.random2D());
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }
  
  void show(){
    rect(pos.x-r, pos.y-r, r*2, r*2);
  }
}