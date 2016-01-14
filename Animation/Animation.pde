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
  if (keyPressed || !s.curMove.equals("")){
    if (key == 'd'){
       s.dir = 'r';
       s.walkRight();
    }
    if (key == 'a'){
       s.dir = 'l';
       s.walkLeft();
    }
    if (key == 'q' && s.curMove.equals("") || s.curMove.equals("punchOne")){
      s.attack(16, 17, "punchOne");
    }
    if (key == 'e' && s.curMove.equals("") || s.curMove.equals("punchTwo")){
      s.attack(18, 19, "punchTwo");
    }
    if (key == 'r' && s.curMove.equals("") || s.curMove.equals("kickUp")){
      s.attack(20, 24, "kickUp");
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
  int x;
  int y = width/2;
  int walkFrame = 0;
  int jumpFrame = 11;
  int attackFrame = 0;
  ArrayList<PImage> images;
  char dir;
  int step = 5;
  String curMove = "";
  
  Sprite(){
    images = new ArrayList<PImage>();
    for (int i = 0; i < 25; i++) {
      String imageName = "Cammy " + "(" + (i+1) + ").png";
      images.add(loadImage(imageName));
    }
  }
  
  void reset(){
    pushMatrix();
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
    if (!curMove.equals("jump")) {
      curMove = "jump";
    }
    image(images.get(jumpFrame),x,y);
    jumpFrame++;
    if (jumpFrame > 15){
      jumpFrame = 11;
    }
  }
  
  void attack(int startFrame, int endFrame, String attackName) {
    // checks if curMove has already been set to this attack
    if (!curMove.equals(attackName)) {
      curMove = attackName;
      attackFrame = startFrame;
    }
    // checks if character is facing left
    if (dir == 'l') {
      scale(-1, 1);
      image(images.get(attackFrame), -(x + images.get(attackFrame).width), y);
    } else {
      image(images.get(attackFrame),x,y);
    }
    attackFrame++;
    if (attackFrame > endFrame){
      curMove = "";
    }
   }

}
  
    