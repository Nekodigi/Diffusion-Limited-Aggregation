
float size = 1;
int speed = 1000;
int maxWalker = 200;

boolean highSpeed = false;
ArrayList<Walker> walkers = new ArrayList<Walker>();
ArrayList<Walker> tree = new ArrayList<Walker>();


void setup(){
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  Walker branch = new Walker(5, new PVector(width/2, height/2));
  tree.add(branch);
}

void draw(){
  background(0);
  if(walkers.size() < maxWalker){
    for(int i = 0; i < 10; i++){
      Walker walker = new Walker(random(1, size));
      walkers.add(walker);
    }
  }
  
  for(int n = 0; n < speed; n++){
    for(int i = walkers.size()-1; i >= 0; i--){
      Walker walker = walkers.get(i);
      walker.walk();
      if(walker.checkStuck(tree)){
        tree.add(walker);
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
}

void mousePressed(){
  if(mouseButton == LEFT){
    Walker branch = new Walker(2, new PVector(mouseX, mouseY));
    tree.add(branch);
  }
}

void keyPressed(){
  if(key == 'h'){
    highSpeed = !highSpeed;
  }
  if(key == 'r'){
    walkers = new ArrayList<Walker>();
    tree = new ArrayList<Walker>();
  }
}