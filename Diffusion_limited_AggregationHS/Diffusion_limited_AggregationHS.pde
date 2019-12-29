float speed = 2;
float size = 1;
int iter = 10000;
int maxWalker = 1000;
int w = (int)size*10;//split size

boolean highSpeed = false;
boolean debug = false;
ArrayList<Walker> walkers;
ArrayList<Walker> tree;
Cell[][] treeRev;
PVector treeMin;
PVector treeMax;
int cols, rows;


void setup(){
  //fullScreen();
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  cols = toCol(width);
  rows = toRow(height);
  
  reset();
  Walker branch = new Walker(2, new PVector(width/2, height/2));
  treeAdd(branch);
}

void draw(){
  background(0);
  
  if(walkers.size() < maxWalker*frameRate/60){
    for(int i = 0; i < 100; i++){
      Walker walker = new Walker(random(1, size));
      walkers.add(walker);
    }
  }
  
  for(int n = 0; n < iter; n++){
    for(int i = walkers.size()-1; i >= 0; i--){
      Walker walker = walkers.get(i);
      walker.walk();//slow
      if(isContains(walker) && walker.checkStuck()){
        if(walker.lifetime > 1000){
          treeAdd(walker);
        }
        walkers.remove(i);
      }
    }
  }
  
  if(!highSpeed){
    fill(360);
    noStroke();
    for(Walker walker : walkers){
      walker.show();
    }
    
    for(Walker branch : tree){
      branch.show();
    }
  }
  if(debug){
    fill(360);
    textSize(20);
    text(frameRate+"FPS", 20, 20);
    text(walkers.size()+"walkers", 20, 60);
    fill(0, 100, 100, 50);
    rect(treeMin.x, treeMin.y, treeMax.x-treeMin.x, treeMax.y-treeMin.y);
  }
}

void mousePressed(){
  if(mouseButton == LEFT){
    Walker branch = new Walker(2, new PVector(mouseX, mouseY));
    treeAdd(branch);
  }
}

void keyPressed(){
  if(key == 'h'){
    highSpeed = !highSpeed;
  }
  if(key == 'r'){
    reset();
  }
  if(key == 'd'){
    debug = !debug;
  }
}