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
    for (int i = 0; i < 182; i++) {
      String imageName = "Cammy " + "(" + (i+1) + ").png";
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
      image(images[3],-images[3].width,0);
    }
    count = 5;
    popMatrix();
  }
  
  void walk(){
    currentFrame = 4;
    if(dir == 'l'){
      this.x -= step;
      image(images[currentFrame-1],-images[currentFrame-1].width,y);
      currentFrame = (currentFrame + 1) % numFrames;
      if (currentFrame == numFrames){
         currentFrame = 0;
    }
    if(dir == 'r'){
      this.x += step;
      image(images[currentFrame],x,y);
      currentFrame = (currentFrame + 1) % numFrames;
      if (currentFrame == numFrames){
         currentFrame = 0;
    }
    }
  }
}
}