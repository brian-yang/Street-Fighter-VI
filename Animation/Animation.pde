Sprite s;
int startTime;

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
       s.walkRight();
    }
    if (key == 'a'){
       s.dir = 'l';
       s.walkLeft();
    }
    if (key == 'q'){
      s.punching1 = true;
      s.punch1();
    }
    if (key == 'e'){
      s.punching2 = true;
      s.punch2();
    }
    if (key == 'r'){
      s.upKicking = true;
      s.upKick(); 
    }
  }
  else s.reset();
}
void keyReleased() {
  int elapsed = millis() - startTime;
     if (key == 'd') {
           startTime = millis();
           println(float(elapsed) / 1000 + " seconds elapsed");
           if (elapsed > 3000){
             image(s.images.get(8),s.x,s.y);
           }
     }  
     if (key == 'a') {
           startTime = millis();
     }
}



class Sprite{
  int x,y;
  int walkFrame = 0;
  int jumpFrame = 11;
  int punch1Frame = 16;
  int punch2Frame = 18;
  int upKickFrame = 20;
  ArrayList<PImage> images;
  boolean jumping, punching1, punching2, upKicking;
  char dir;
  int step = 5;
  
  Sprite(){
    images = new ArrayList<PImage>();
    for (int i = 0; i < 25; i++) {
      String imageName = "Cammy " + "(" + (i+1) + ").png";
      images.add(loadImage(imageName));
    }
  }
  
  void reset(){
    pushMatrix();
    fill(255);
    if (dir == 'l'){
      scale(-1, 1);
      image(images.get(6),-(x + images.get(6).width),y);

    }
    if (dir == 'r'){
      image(images.get(6), x, y); 
    }
    popMatrix();
  }
  
  void walkLeft(){
      x -= step;
      scale(-1 ,1);
      image(images.get(walkFrame),-(x + images.get(walkFrame).width),y);
      walkFrame++;
      if (walkFrame > 5){
        walkFrame = 0;
      }
    }
  
  void walkRight(){
      x += step;
      image(images.get(walkFrame),x,y);
      walkFrame++;
      if (walkFrame > 5){
        walkFrame = 0;
      }
    }
  
  void jump(){
    if (jumping == true){
        image(images.get(jumpFrame),x,y);
        jumpFrame++;
        if (jumpFrame > 15){
          jumpFrame = 11;
        }
    }
  }
  
  void punch1(){
    if (punching1 == true){
        image(images.get(punch1Frame),x,y);
        punch1Frame++;
        if (punch1Frame > 17){
          punch1Frame = 16;
        }
      }
  }
      
  void punch2(){
    if (punching2 == true){
        image(images.get(punch2Frame),x,y);
        punch2Frame++;
        if (punch2Frame > 19){
          punch2Frame = 18;
        }
      }
  }
      
  void upKick(){
    if (upKicking == true){
        image(images.get(upKickFrame),x,y);
        upKickFrame++;
        if (upKickFrame > 24){
          upKickFrame = 20;
        }
    }
  }
}
  
    