Sprite p,q;
int nrKeys = 0;
PFont font;
boolean[] downKeys = new boolean[261]; // account for special keys
int startTime;

// need to fix y cor for the crouchMoves 
// need to make characters stop flickering


void setup(){
  size(600,400);
  background(255);
  smooth();
  font = createFont("Courier",20);
  textFont(font);
  frameRate(8);
  p = new Sprite(0, width/2);
  q = new Sprite(100, width/2);
}

void draw(){
  background(0);
  nrKeys = 0;
  for (int i=0; i < downKeys.length; i++) {
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
 if (key < 256) {
   downKeys[key] = true; 
 }
 if (keyCode == RIGHT) {
   downKeys[256] = true;
 }
 if (keyCode == LEFT) {
   downKeys[257] = true;
 }
 if (keyCode == DOWN) {
   downKeys[258] = true;
 }
 if (keyCode == UP) {
   downKeys[259] = true;
 }
 if (keyCode == SHIFT) {
   downKeys[260] = true;
 }
 interrupt();
}

void keyReleased() {
 if (key < 256) {
   downKeys[key] = false;  
 }
 if (keyCode == RIGHT) {
   downKeys[256] = false;
 }
 if (keyCode == LEFT) {
   downKeys[257] = false;
 }
 if (keyCode == DOWN) {
   downKeys[258] = false;
 }
 if (keyCode == UP) {
   downKeys[259] = false;
 }
 if (keyCode == SHIFT) {
   downKeys[260] = false;
 }
}

void interrupt() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      setCommands(256);
    } else if (keyCode == LEFT) {
      setCommands(257);
    } else if (keyCode == DOWN) {
      setCommands(258);
    } else if (keyCode == UP) {
      setCommands(259);
    } else if (keyCode == SHIFT) {
      setCommands(260);
    }
  } else if (key < 256) {
    setCommands(key);
  }
}

// keep this
boolean checkKeys() {
  int keys = 0;
  for (int i = 0; i < downKeys.length; i++) {
    if (downKeys[i]) {
      keys++;
    }
  }
  if (keys != 1) {
    return false;
  }
  return true;
}

void setCommands(int index) {
  for (int i = 0; i < downKeys.length; i++) {
    if (i != index) {
      downKeys[i] = false;
    }
  }
}

void actionP1(Sprite s){
    // P1
    if (downKeys['d']){
       s.dir = 'r';
       s.walkRight();
    } else if (downKeys['a']){
       s.dir = 'l';
       s.walkLeft();
    } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")){
      s.crouchMove(21 , 21, "crouch");
    } else if (downKeys['g'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick")){
      s.crouchMove(36, 37, "crouchKick");
    } else if (downKeys['h'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick2")){
      s.crouchMove(38, 41, "crouchKick2");
    } else if (downKeys['e'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch")){
      s.crouchMove(42, 43, "crouchPunch");
    } else if (downKeys['q'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch2")){
      s.crouchMove(44, 46, "crouchPunch2");
    } else if (downKeys['q'] && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchOne")){
      s.attack(16, 17, "punchOne");
    } else if (downKeys['e'] && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchTwo")){
      s.attack(18, 19, "punchTwo");
    } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")){
      s.attack(20, 24, "kickUp");
    } else if (downKeys['f'] && !s.inAir && s.curMove.equals("") || s.curMove.equals("kick")){
      s.attack(25, 26, "kick");
    } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("flyKick")){
      s.attack(27, 29, "flyKick");
    } else if (downKeys['c'] && s.curMove.equals("") || s.curMove.equals("spinningKnuckle")){
      s.attack(30, 33, "spinningKnuckle");
    } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")){
      s.jumpUp(47, 52, "jump");
    } else if (downKeys['f'] && s.curMove.equals("") || s.curMove.equals("jumpKick")){
      s.jumpUp(53, 54, "jumpKick");
    } else {
      s.reset();
    }
}

void actionP2(Sprite s2) {
    // P2
    if (downKeys[256]){
       s2.dir = 'r';
       s2.walkRight();
    } else if (downKeys[257]){
       s2.dir = 'l';
       s2.walkLeft();
    } else if (downKeys[','] && !s2.crouching && s2.curMove.equals("") || s2.curMove.equals("punchOne")){
      s2.attack(16, 17, "punchOne");
    } else if (downKeys['.'] && !s2.crouching && s2.curMove.equals("") || s2.curMove.equals("punchTwo")){
      s2.attack(18, 19, "punchTwo");
    } else if (downKeys['/'] && s2.curMove.equals("") || s2.curMove.equals("kickUp")){
      s2.attack(20, 24, "kickUp");
    } else if (downKeys[260] && !s2.inAir && s2.curMove.equals("") || s2.curMove.equals("kick")){
      s2.attack(25, 26, "kick");
    } else if (downKeys['m'] && s2.curMove.equals("") || s2.curMove.equals("flyKick")){
      s2.attack(27, 29, "flyKick");
    } else if (downKeys[258] && s2.curMove.equals("") || s2.curMove.equals("crouch")){
      s2.crouchMove(21 , 21, "crouch");
    } else if (downKeys[259] && s2.curMove.equals("") || s2.curMove.equals("jump")){
      s2.jumpUp(47 , 52, "jump");
    } else {
      s2.reset();
    }
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