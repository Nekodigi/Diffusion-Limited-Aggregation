float distSq(PVector a, PVector b){
  float dx = a.x - b.x;
  float dy = a.y - b.y;
  return dx * dx + dy * dy;
}

PVector randomPoint(){
    int i = floor(random(4));
    switch(i){
      case 0:
        return new PVector(random(width), 0);
      case 1:
        return new PVector(0, random(height));
      case 2:
        return new PVector(random(width), height);
      default:
        return new PVector(width, random(height));
    }
  }
  
int toCol(float x){
  return ceil(x/w);
}

int toRow(float y){
  return ceil(y/w);
}

boolean isEnableSelector(int col, int row){
  if(col > 1 && row > 1 && col < cols-1 && row < rows-1){
    return true;
  }
  return false;
}

void treeAdd(Walker branch){
  treeRev[toCol(branch.pos.x)][toRow(branch.pos.y)].walkers.add(branch);
  tree.add(branch);
  if(branch.pos.x-branch.r < treeMin.x){
    treeMin.x = branch.pos.x-branch.r;
  }
  if(branch.pos.y-branch.r < treeMin.y){
    treeMin.y = branch.pos.y-branch.r;
  }
  if(branch.pos.x+branch.r > treeMax.x){
    treeMax.x = branch.pos.x+branch.r;
  }
  if(branch.pos.y+branch.r > treeMax.y){
    treeMax.y = branch.pos.y+branch.r;
  }
}

boolean isContains(Walker branch){
  if(treeMin.x < branch.pos.x+branch.r && treeMax.x > branch.pos.x-branch.r && treeMin.y < branch.pos.y+branch.r && treeMax.y > branch.pos.y-branch.r){
    return true;
  }
  return false;
}