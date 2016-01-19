Sprite p, q;
float rectWidth = 200;
PFont font;
boolean[] downKeys = new boolean[261]; // account for special keys
boolean[] downKeys2 = new boolean[261]; // for player 2
char[] controls = new char[] {'w', 'a', 's', 'd', 
  'g', 'h', 'e', 'q', 
  'r', 'f', 'x', 'c'};
char[] controls2 = new char[] {',', '.', '/', 'm'};

void setup() {

  size(600, 400);
  background(255);
  smooth();
  font = createFont("Courier", 20);
  textFont(font);
  frameRate(10);
  p = new Sprite(100, width / 2, "Cammy");
  q = new Sprite(200, width / 2, "Cammy");
}

void draw() {
  grid();
  makeHealthBar();
  action(p,q);
  hitbox(p, q);
  hitbox(q, p);
}

void keyPressed() {
  if (key < 256) {
    downKeys[key] = true;
    downKeys2[key] = true;
  }
  if (keyCode == RIGHT) {
    downKeys2[256] = true;
  }
  if (keyCode == LEFT) {
    downKeys2[257] = true;
  }
  if (keyCode == DOWN) {
    downKeys2[258] = true;
  }
  if (keyCode == UP) {
    downKeys2[259] = true;
  }
  if (keyCode == SHIFT) {
    downKeys2[260] = true;
  }
  interrupt(downKeys, 1);
  interrupt(downKeys2, 2);
}

void keyReleased() {
  if (key < 256) {
    downKeys[key] = false;
    downKeys2[key] = false;
  }
  if (keyCode == RIGHT) {
    downKeys2[256] = false;
  }
  if (keyCode == LEFT) {
    downKeys2[257] = false;
  }
  if (keyCode == DOWN) {
    downKeys2[258] = false;
  }
  if (keyCode == UP) {
    downKeys2[259] = false;
  }
  if (keyCode == SHIFT) {
    downKeys2[260] = false;
  }
}

void interrupt(boolean[] commands, int playerNum) {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      setCommands(256, commands, playerNum);
    } else if (keyCode == LEFT) {
      setCommands(257, commands, playerNum);
    } else if (keyCode == DOWN) {
      setCommands(258, commands, playerNum);
    } else if (keyCode == UP) {
      setCommands(259, commands, playerNum);
    } else if (keyCode == SHIFT) {
      setCommands(260, commands, playerNum);
    }
  } else if (key < 256) {
    setCommands(key, commands, playerNum);
  }
}

void setCommands(int index, boolean[] commands, int playerNum) {
  for (int i = 0; i < commands.length; i++) {
    if (playerNum == 1) {
      if (validKey(index, controls) && i != index) {
        commands[i] = false;
      }
    } else if (playerNum == 2) {
      if (validKey(index, controls2) && i != index) {
        commands[i] = false;
      }
    }
  }
}

boolean validKey(int index, char[] characters) {
  for (int i = 0; i < characters.length; i++) {
    if (index == characters[i]) {
      return true;
    }
  }
  return false;
}

void grid() {
  int step = 20;
  background(255);
  for(int i = 0; i < width/step; i++ ) {
   line(i*step, 0, i*step, height);
   line(0, i*step, width, i*step);
 }
}



void action(Sprite s, Sprite s2) {
  // P1  
  if (s.name == "Cammy") {
    if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight") && !s.gettingHit) {
      s.dir = 'r';
      s.walkMove(0, 5, "walkRight");
    } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
      s.dir = 'l'; 
      s.walkMove(0, 5, "walkLeft");
    } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
      s.crouchMove(21, 21, "crouch");
    } else if (downKeys['g'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
      s.crouchMove(36, 37, "crouchKick");
    } else if (downKeys['h'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
      s.crouchMove(38, 41, "crouchKick2");
    } else if (downKeys['e'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
      s.crouchMove(42, 43, "crouchPunch");
    } else if (downKeys['q'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch2")) {
      s.crouchMove(44, 46, "crouchPunch2");
    } else if (downKeys['q'] && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchOne")) {
      s.attack(16, 17, "punchOne");
    } else if (downKeys['e'] && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchTwo")) {
      s.attack(18, 19, "punchTwo");
    } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")) {
      s.attack(20, 24, "kickUp");
    } else if (downKeys['f'] && !s.inAir && s.curMove.equals("") || s.curMove.equals("kick")) {
      s.attack(25, 26, "kick");
    } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
      s.attack(27, 29, "flyKick");
    } else if (downKeys['c'] && s.curMove.equals("") || s.curMove.equals("spinningKnuckle")) {
      s.attack(30, 33, "spinningKnuckle");
    } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
      s.jumpMove(47, 52, "jump");
    } else if (downKeys['f'] && s.curMove.equals("") || s.curMove.equals("jumpKick")) {
      s.jumpMove(53, 54, "jumpKick");
    } else if (s.gettingHit && s2.attacking && s.curMove.equals("") || s.curMove.equals("gotHit")){
      s.getHit(106, 108, "gotHit");
    } else {
      s.reset(6);
    }
  }
  if (s.name == "Ken") {
    if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
      s.dir = 'r';
      s.walkMove(181, 186, "walkRight");
    } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
      s.dir = 'l';
      s.walkMove(181, 186, "walkLeft");
    } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
      s.crouchMove(187, 187, "crouch");
    } else if (downKeys['g'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
      s.crouchMove(188, 190, "crouchKick");
    } else if (downKeys['h'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
      s.crouchMove(191, 196, "crouchKick2");
    } else if (downKeys['e'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
      s.crouchMove(197, 200, "crouchPunch");
    } else if (downKeys['q'] && s.crouching && s.curMove.equals("") || s.curMove.equals("crouchPunch2")) {
      s.crouchMove(204, 207, "crouchPunch2");
    } else if (downKeys['q'] && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchOne")) {
      s.attack(201, 203, "punchOne");
      //} else if (downKeys['e'] && !s.crouching && s.curMove.equals("") || s.curMove.equals("punchTwo")){
      //  s.attack(18, 19, "punchTwo");
    } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kick1")) {
      s.attack(215, 217, "kick1");
    } else if (downKeys['f'] && !s.inAir && s.curMove.equals("") || s.curMove.equals("kick2")) {
      s.attack(218, 225, "kick2");
    } else if (downKeys['v'] && !s.inAir && s.curMove.equals("") || s.curMove.equals("kick3")) {
      s.attack(244, 247, "kick3");
    } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
      s.attack(254, 257, "flyKick");
    } else if (downKeys['c'] && s.curMove.equals("") || s.curMove.equals("spinningKick")) {
      s.attack(258, 267, "spinningKick");
    } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
      s.jumpMove(229, 232, "jump");
    } else if (downKeys['b'] && s.curMove.equals("") || s.curMove.equals("kamekameha")) {
      s.attack(240, 243, "kamekameha");
    } else {
      s.reset(181);
    }
  }
  // P2
  if (s2.name == "Cammy") {
    if (downKeys2[256] && s2.curMove.equals("") || s2.curMove.equals("walkRight")) {
      s2.dir = 'r';
      s2.walkMove(0, 5, "walkRight");
    } else if (downKeys2[257] && s2.curMove.equals("") || s2.curMove.equals("walkLeft")) {
      s2.dir = 'l';
      s2.walkMove(0, 5, "walkLeft");
    } else if (downKeys2[','] && !s2.crouching && s2.curMove.equals("") || s2.curMove.equals("punchOne")) {
      s2.attack(16, 17, "punchOne");
    } else if (downKeys2['.'] && !s2.crouching && s2.curMove.equals("") || s2.curMove.equals("punchTwo")) {
      s2.attack(18, 19, "punchTwo");
    } else if (downKeys2['/'] && s2.curMove.equals("") || s2.curMove.equals("kickUp")) {
      s2.attack(20, 24, "kickUp");
    } else if (downKeys2[260] && !s2.inAir && s2.curMove.equals("") || s2.curMove.equals("kick")) {
      s2.attack(25, 26, "kick");
    } else if (downKeys2['m'] && s2.curMove.equals("") || s2.curMove.equals("flyKick")) {
      s2.attack(27, 29, "flyKick");
    } else if (downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouch")) {
      s2.crouchMove(21, 21, "crouch");
    } else if (downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("jump")) {
      s2.jumpMove(47, 52, "jump");
    } else if (downKeys2[']'] && s2.curMove.equals("") || s2.curMove.equals("jumpKick")) {
      s2.jumpMove(53, 54, "jumpKick");
    } else if (s2.gettingHit && s.attacking && s2.curMove.equals("") || s2.curMove.equals("gotHit")){
      s2.getHit(106, 108, "gotHit");
    } else {
      s2.reset(6);
    }
  }

  if (s2.name == "Ken") {
  }
}

void makeHealthBar(){
   if (p.health < 0.25 * q.MAX_HEALTH){
    fill(255, 0, 0);
  } else if (p.health < 0.4 * q.MAX_HEALTH){
    fill(255, 200, 0);
  } else{
    fill(0, 255, 0);
  }
   
  noStroke();
  float drawWidth = (p.health / p.MAX_HEALTH) * rectWidth;
  rect(50, 50, drawWidth, 40, 50);
   
  stroke(0);
  noFill();
  rect(50, 50, rectWidth, 40, 50);
  
  if (q.health < 0.25 * q.MAX_HEALTH){
    fill(255, 0, 0);
  } else if (q.health < 0.4 * q.MAX_HEALTH){
    fill(255, 200, 0);
  } else{
    fill(0, 255, 0);
  }
   
  noStroke();
  float drawWidth2 = (q.health / q.MAX_HEALTH) * rectWidth;
  rect(350, 50, drawWidth2, 40, 50);
   
  stroke(0);
  noFill();
  rect(350, 50, rectWidth, 40, 50);
}

void hitbox(Sprite s, Sprite s2){
  if (s.getX() > s2.getX() - 1.25 * s2.getWidth() && s.getX() < s2.getX() && s.dir == 'r' &&
      s.getY() >= s2.getY() && s.getY() < s2.getY() + s2.getHeight()){
      if (s.attacking){
        s2.takeDamage(10);
        s2.gettingHit = true;
      }
  } else if (s.getX() < s2.getX() + 0.8 * s2.getWidth() && s.getX() > s2.getX() && s.dir == 'l' &&
            s.getY() >= s2.getY() && s.getY() < s2.getY() + s2.getHeight()){
      if (s.attacking) {
        s2.takeDamage(10);
      }
  }
}