Sprite s;

void setup(){
  size(600,400);
  background(255);
  smooth();
  frameRate(10);
  s = new Sprite();
}

void draw(){
  background(255);
  if (keyPressed){
    if (key == 'd'){
      s.dir = 'r';
    }
    if (key == 'a'){
      s.dir = 'l';
    }
  s.walk();
  }
  else s.reset();
}

class Sprite{
  int x,y;
  int numFrames, currentFrame;
  PImage[] images;
  float speedX, speedY;
  char dir;
  int step = 5;
  int count;
  boolean left, right, up, down;
  
  Sprite(){
    numFrames = 4;
    currentFrame = 0;
    images = new PImage[numFrames];
    for (int i = 0; i < numFrames; i++) {
      String imageName = (i+12) + ".png";
      images[i] = loadImage(imageName);
    }
  }
  
  void reset(){
    pushMatrix();
    fill(255);
    if (dir == 'r'){
      image(images[3], x, y);
    }
    if (dir == 'l'){
      // stuff
    }
    count = 5;
    popMatrix();
  }
  
  void walk(){
    if(dir == 'l'){
      //stuff
    }
    if(dir == 'r'){
      this.x += step;
    }
    image(images[currentFrame],x,y);
    currentFrame = (currentFrame + 1) % numFrames;
    if (currentFrame == numFrames){
       currentFrame = 0;
    }
  }
}