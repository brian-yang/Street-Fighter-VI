Sprite p,q;
int nrKeys = 0;
PFont font;
boolean[] downKeys = new boolean[258]; // account for arrow keys
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
  actionP1(p, q);
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
 //For debugging
 //if (key == 'd' && p.dir == 'l') {
 //  p.dir = 'r';
 //  downKeys['a'] = false;
 //  p.reset = false;
 //} else if (key == 'a' && p.dir == 'r') {
 //  p.dir = 'l';
 //  downKeys['d'] = false;
 //  p.reset = false;
 //} 
 //if (keyCode == RIGHT && p.dir == 'l') {
 //  q.dir = 'r';
 //  q.reset = false;
 //} else if (keyCode == LEFT && p.dir == 'r') {
 //  q.dir = 'l';
 //  q.reset = false;
 //}
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

void actionP1(Sprite s, Sprite s2){
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
      s.attack(36, 37, "crouchKick");
    } else if (downKeys['h'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick2")){
      s.attack(38, 41, "crouchKick2");
    } else if (downKeys['e'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch")){
      s.attack(42, 43, "crouchPunch");
    } else if (downKeys['q'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch2")){
      s.attack(44, 46, "crouchPunch2");
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
      s.jumpMove(47, 52, "jump");
    } else if (downKeys['f'] && s.curMove.equals("") || s.curMove.equals("jumpKick")){
      s.jumpMove(53, 54, "jumpKick");
    } else {
      s.reset();
    }
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
    } else if (keyCode == SHIFT && s2.curMove.equals("") || s2.curMove.equals("kick")){
      s2.attack(25, 26, "kick");
    } else if (downKeys['m'] && s2.curMove.equals("") || s2.curMove.equals("flyKick")){
      s2.attack(27, 29, "flyKick");
    // Needs fixing
    } else if (keyCode == DOWN && s2.curMove.equals("") || s2.curMove.equals("crouch")){
      s2.crouchMove(21 , 21, "crouch");
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