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
  int currentFrame;
  ArrayList<PImage> images;
  float speedX, speedY;
  char dir;
  int step = 5;
  int count;
  boolean left, right, up, down;
  int numFrames = 4;
  
  Sprite(){
    images = new ArrayList<PImage>();
    for (int i = 0; i < 182; i++) {
      String imageName = "Cammy " + "(" + (i+1) + ").png";
      images.add(loadImage(imageName));
    }
  }
  
  void reset(){
    pushMatrix();
    fill(255);
    if (dir == 'l'){
      scale(-1, 1);
      image(images.get(3),-(x + images.get(3).width),y);
    }
    if (dir == 'r'){
      image(images.get(3), x, y);
    }
    count = 5;
    popMatrix();
  }
  
  void walk(){
    currentFrame = 4;
    if(dir == 'l'){
      x -= step;
      scale(-1 ,1);
      image(images.get(currentFrame),-(x + images.get(currentFrame).width),y);
      currentFrame = (currentFrame + 1) % numFrames;
    }
    if(dir == 'r'){
      x += step;
      image(images.get(currentFrame),x,y);
      currentFrame = (currentFrame + 1) % numFrames;
    }
  }
}
