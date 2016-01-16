Sprite p,q;
int nrKeys = 0;
PFont font;
boolean[]downKeys = new boolean[256];
int startTime;


// need to fix y cor for the crouchMoves 
// need to make characters stop flickering


void setup(){
  size(600,400);
  background(255);
  smooth();
  font = createFont("Courier",20);
  textFont(font);
  frameRate(10);
  p = new Sprite(0, width/2);
  q = new Sprite(100, width/2);
}

void draw(){
  background(0);
  nrKeys = 0;
  for (int i=0; i<downKeys.length; i++) {
     if (downKeys[i]) {
       nrKeys++; 
       text((char)i, 10*nrKeys,height/2);
     }
   }
  text("Nr. of Keys: " + nrKeys, 20,20); 
  actionP1(p);
  actionP2(q);
}

void keyPressed() {
 if (key<256) {
   downKeys[key] = true; 
 }
}

void keyReleased() {
 if (key<256) {
   downKeys[key] = false;  
 }
}

void actionP1(Sprite s){
  if (keyPressed || !s.curMove.equals("")){
    if (key == 'd'){
       s.dir = 'r';
       s.walkRight();
    }
    if (key == 'a'){
       s.dir = 'l';
       s.walkLeft();
    }
    if (key == 'q' && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchOne")){
      s.attack(16, 17, "punchOne");
    }
    if (key == 'e' && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchTwo")){
      s.attack(18, 19, "punchTwo");
    }
    if (key == 'r' && s.curMove.equals("") || s.curMove.equals("kickUp")){
      s.attack(20, 24, "kickUp");
    }
    if (key == 'f' && s.curMove.equals("") || s.curMove.equals("kick")){
      s.attack(25, 26, "kick");
    }
    if (key == 'x' && s.curMove.equals("") || s.curMove.equals("flyKick")){
      s.attack(27, 29, "flyKick");
    }
    if (key == 'c' && s.curMove.equals("") || s.curMove.equals("spinningKnuckle")){
      s.attack(30, 33, "spinningKnuckle");
    }
    if (key == 'g' && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick")){
      s.attack(36, 37, "crouchKick");
    }
    if (key == 'h' && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick2")){
      s.attack(38, 41, "crouchKick2");
    }
    if (key == 'e' && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch")){
      s.attack(42, 43, "crouchPunch");
    }
    if (key == 'q' && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch2")){
      s.attack(44, 46, "crouchPunch2");
    }
    if (key == 's' && s.curMove.equals("") || s.curMove.equals("crouch")){
      s.crouchMove(21 , 21, "crouch");
    }
  }
  else s.reset();
}

void actionP2(Sprite s){
  if (keyPressed || !s.curMove.equals("")){
    if (keyCode == RIGHT){
       s.dir = 'r';
       s.walkRight();
    }
    if (keyCode == LEFT){
       s.dir = 'l';
       s.walkLeft();
    }
    if (key == ',' && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchOne")){
      s.attack(16, 17, "punchOne");
    }
    if (key == '.' && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchTwo")){
      s.attack(18, 19, "punchTwo");
    }
    if (key == '/' && s.curMove.equals("") || s.curMove.equals("kickUp")){
      s.attack(20, 24, "kickUp");
    }
    if (keyCode == SHIFT && s.curMove.equals("") || s.curMove.equals("kick")){
      s.attack(25, 26, "kick");
    }
    if (key == 'm' && s.curMove.equals("") || s.curMove.equals("flyKick")){
      s.attack(27, 29, "flyKick");
    }
    if (key == 'n' && s.curMove.equals("") || s.curMove.equals("spinningKnuckle")){
      s.attack(30, 33, "spinningKnuckle");
    }
    if (key == 'l' && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick")){
      s.attack(36, 37, "crouchKick");
    }
    if (key == 'k' && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick2")){
      s.attack(38, 41, "crouchKick2");
    }
    if (key == 'j' && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch")){
      s.attack(42, 43, "crouchPunch");
    }
    if (key == ',' && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch2")){
      s.attack(44, 46, "crouchPunch2");
    }
    if (key == DOWN && s.curMove.equals("") || s.curMove.equals("crouch")){
      s.crouchMove(21 , 21, "crouch");
    }
  }
  else s.reset();
}


//void keyReleased() {
//  int elapsed = millis() - startTime;
//     if (key == 'd') {
//           startTime = millis();
//           println(float(elapsed) / 1000 + " seconds elapsed");
//           if (elapsed > 3000){
//             image(p.images.get(8),p.x,p.y);
//           }
//     }  
//     if (key == 'a') {
//           startTime = millis();
//     }
//}

class Sprite{
  int x,y;
  int walkFrame = 0;
  int jumpFrame = 11;
  int attackFrame = 0;
  int crouchFrame = 0;
  ArrayList<PImage> images;
  char dir;
  int step = 5;
  String curMove = "";
  boolean crouching;
  
  Sprite(int x, int y){
    images = new ArrayList<PImage>();
    for (int i = 0; i < 47; i++) {
      String imageName = "Cammy " + "(" + (i+1) + ").png";
      images.add(loadImage(imageName));
    }
    this.x = x;
    this.y = y;
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
  
  void crouchMove(int startFrame, int endFrame, String crouchName) {
   // checks if curMove has already been set to this attack
   crouching = true;
   if (!curMove.equals(crouchName)) {
     curMove = crouchName;
     crouchFrame = startFrame;
   }
   // checks if character is facing left
   if (dir == 'l') {
     scale(-1, 1);
     image(images.get(crouchFrame), -(x + images.get(crouchFrame).width), y + 40);
   } else {
     image(images.get(crouchFrame),x,y + 40);
   }
   crouchFrame++;
   if (crouchFrame > endFrame){
     curMove = "";
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
  
    