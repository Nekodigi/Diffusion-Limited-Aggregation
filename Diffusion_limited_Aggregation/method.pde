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