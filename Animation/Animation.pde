Sprite p, q;
float rectWidth = 200;
PFont font;
boolean[] downKeys = new boolean[260]; // account for special keys
boolean[] downKeys2 = new boolean[260]; // for player 2
char[] controls = new char[] {'w', 'a', 's', 'd', 
  'g', 'h', 'e', 'q', 
  'r', 'f', 'x', 'c'};
char[] controls2 = new char[] {',', '.', '/', 'm'};

void setup() {
  size(600, 400);
  background(0);
  smooth();
  font = createFont("Courier", 20);
  textFont(font);
  frameRate(10);
  p = new Sprite(width/2 - 100, 200, "Ryu");
  q = new Sprite(width/2 + 100, 200, "Ryu");
  q.dir = 'l';
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
}

void interrupt(boolean[] commands, int playerNum) {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      setCommands(256, commands, playerNum);
    } else if (keyCode == LEFT) {
      setCommands(257, commands, playerNum);
    }
  } else if (key < 256) {
    if (key != 's' || key != 'w') {
      setCommands(key, commands, playerNum);
    }
  }
}

void setCommands(int index, boolean[] commands, int playerNum) {
  for (int i = 0; i < commands.length; i++) {
    if (playerNum == 1) {
      if (validKey(index, controls) && i != index) {
        if (i == 's' && commands['s'] && !commands['w']) {
          commands[i] = true;
        } else if (i == 'w' && commands['w'] && !commands['s']) {
          commands[i] = true;
        } else {
          commands[i] = false;
        }
      }
    } else if (playerNum == 2) {
      if (validKey(index, controls2) && i != index) {
        if (i == 258 && commands[258] && !commands[259]) {
          commands[i] = true;
        } else if (i == 259 && commands[259] && !commands[258]) {
          commands[i] = true;
        } else {
          commands[i] = false;
        }
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
   noStroke();
   line(i*step, 0, i*step, height);
   line(0, i*step, width, i*step);
 }
}


// String checks need to use equals()
void action(Sprite s, Sprite s2) {
  // P1
  if (s.name == "Cammy") {
    if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")){
      s.getHit(106, 108, "getHit");
    } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
      s.dir = 'r';
      s.walkMove(0, 5, "walkRight");
    } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
      s.dir = 'l'; 
      s.walkMove(0, 5, "walkLeft");
    } else if (downKeys['g'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
      s.crouchMove(36, 37, "crouchKick");
    } else if (downKeys['h'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
      s.crouchMove(38, 41, "crouchKick2");
    } else if (downKeys['q'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
      s.crouchMove(42, 43, "crouchPunch");
    } else if (downKeys['e'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch2")) {
      s.crouchMove(44, 46, "crouchPunch2");
    } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
      s.crouchMove(21, 21, "crouch");
    } else if (downKeys['q'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punchOne")) {
      s.attack(16, 17, "punchOne");
    } else if (downKeys['e'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punchTwo")) {
      s.attack(18, 19, "punchTwo");
    } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")) {
      s.attack(20, 24, "kickUp");
    } else if (downKeys['f'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick")) {
      s.attack(25, 26, "kick");
    } else if (downKeys['g'] && s.curMove.equals("") || s.curMove.equals("kick2")) {
      s.attack(27, 29, "kick2");
    } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("spinningKnuckle")) {
      s.attack(30, 33, "spinningKnuckle");
    } else if (downKeys['g'] && downKeys['w'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
      s.jumpMove(53, 54, "flyKick");
    } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
      s.jumpMove(47, 52, "jump");
    } else {
      s.reset(6);
    }
  }
  // P2
  if (s2.name == "Cammy") {
     if (s2.state.equals("getHit") && s2.curMove.equals("") || s2.curMove.equals("getHit")){
      s2.getHit(106, 108, "getHit");
    } else if (downKeys2[256] && s2.curMove.equals("") || s2.curMove.equals("walkRight")) {
      s2.dir = 'r';
      s2.walkMove(0, 5, "walkRight");
    } else if (downKeys2[257] && s2.curMove.equals("") || s2.curMove.equals("walkLeft")) {
      s2.dir = 'l'; 
      s2.walkMove(0, 5, "walkLeft");
    } else if (downKeys2['n'] && downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouchKick")) {
      s2.crouchMove(36, 37, "crouchKick");
    } else if (downKeys2['m'] && downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouchKick2")) {
      s2.crouchMove(38, 41, "crouchKick2");
    } else if (downKeys2['j'] && downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch")) {
      s2.crouchMove(42, 43, "crouchPunch");
    } else if (downKeys2['k'] && downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch2")) {
      s2.crouchMove(44, 46, "crouchPunch2");
    } else if (downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouch")) {
      s2.crouchMove(21, 21, "crouch");
    } else if (downKeys2['j'] && !downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("punchOne")) {
      s2.attack(16, 17, "punchOne");
    } else if (downKeys2['k'] && !downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("punchTwo")) {
      s2.attack(18, 19, "punchTwo");
    } else if (downKeys2['l'] && s2.curMove.equals("") || s2.curMove.equals("kickUp")) {
      s2.attack(20, 24, "kickUp");
    } else if (downKeys2['n'] && !downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("kick")) {
      s2.attack(25, 26, "kick");
    } else if (downKeys2['m'] && s2.curMove.equals("") || s2.curMove.equals("kick2")) {
      s2.attack(27, 29, "kick2");
    } else if (downKeys2[','] && s2.curMove.equals("") || s2.curMove.equals("spinningKnuckle")) {
      s2.attack(30, 33, "spinningKnuckle");
    } else if (downKeys2['m'] && downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("jumpKick")) {
      s2.jumpMove(53, 54, "jumpKick");
    } else if (downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("jump")) {
      s2.jumpMove(47, 52, "jump");
    } else {
      s2.reset(6);
    }
  }
  
  if (s.name == "Ken") {
     if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       s.dir = 'r';
       s.walkMove(181, 186, "walkRight");
     } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
       s.dir = 'l';
       s.walkMove(181, 186, "walkLeft");
     } else if (downKeys['f'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
       s.crouchMove(188, 190, "crouchKick");
     } else if (downKeys['h'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
       s.crouchMove(191, 196, "crouchKick2");
     } else if (downKeys['q'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
       s.crouchMove(197, 200, "crouchPunch");
     } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
       s.crouchMove(187, 187, "crouch");
     } else if (downKeys['q'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punchOne")) {
       s.attack(201, 203, "punchOne");
     } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")) {
       s.attack(215, 217, "kickUp");
     } else if (downKeys['f'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick2")) {
       s.attack(218, 225, "kick2");
     } else if (downKeys['g'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick3")) {
       s.attack(244, 247, "kick3");
     } else if (downKeys['f'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
       s.attack(254, 257, "flyKick");
     } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("spinningKick")) {
       s.attack(258, 267, "spinningKick");
     } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
       s.jumpMove(229, 232, "jump");
     } else if (downKeys['c'] && s.curMove.equals("") || s.curMove.equals("kamekameha")) {
       s.attack(240, 243, "kamekameha");
     } else {
       s.reset(181);
     }
  }
  if (s2.name == "Ken") {
      if (downKeys2[256] && s2.curMove.equals("") || s2.curMove.equals("walkRight")) {
       s2.dir = 'r';
       s2.walkMove(181, 186, "walkRight");
     } else if (downKeys2[257] && s2.curMove.equals("") || s2.curMove.equals("walkLeft")) {
       s2.dir = 'l';
       s2.walkMove(181, 186, "walkLeft");
     } else if (downKeys2['n'] && downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouchKick")) {
       s2.crouchMove(188, 190, "crouchKick");
     } else if (downKeys2['m'] && downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouchKick2")) {
       s2.crouchMove(191, 196, "crouchKick2");
     } else if (downKeys2['j'] && downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch")) {
       s2.crouchMove(197, 200, "crouchPunch");
     } else if (downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouch")) {
       s2.crouchMove(187, 187, "crouch");
     } else if (downKeys2['j'] && !downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("punchOne")) {
       s2.attack(201, 203, "punchOne");
     } else if (downKeys2['l'] && s2.curMove.equals("") || s2.curMove.equals("kickUp")) {
       s2.attack(215, 217, "kickUp");
     } else if (downKeys2['n'] && !downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("kick2")) {
       s2.attack(218, 225, "kick2");
     } else if (downKeys2['m'] && !downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("kick3")) {
       s2.attack(244, 247, "kick3");
     } else if (downKeys2['n'] && s2.curMove.equals("") || s2.curMove.equals("flyKick")) {
       s2.attack(254, 257, "flyKick");
     } else if (downKeys2[','] && downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("spinningKick")) {
       s2.attack(258, 267, "spinningKick");
     } else if (downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("jump")) {
       s2.jumpMove(229, 232, "jump");
     } else if (downKeys2['.'] && s2.curMove.equals("") || s2.curMove.equals("kamekameha")) {
       s2.attack(240, 243, "kamekameha");
     } else {
       s2.reset(181);
     }
  }
  if (s.name == "Ryu"){
    if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       s.dir = 'r';
       s.walkMove(300, 304, "walkRight");
     } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
       s.dir = 'l';
       s.walkMove(300, 304, "walkLeft");
     } else if (downKeys['f'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
       s.crouchMove(309, 311, "crouchKick");
     } else if (downKeys['h'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
       s.crouchMove(333, 338, "crouchKick2");
     } else if (downKeys['q'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
       s.crouchMove(320, 323, "crouchPunch");
     //} else if (downKeys['e'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch2")) {
     //  s.crouchMove(197, 200, "crouchPunch2");
     } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
       s.crouchMove(309, 309, "crouch");
     } else if (downKeys['q'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punchOne")) {
       s.attack(317, 319, "punchOne");
     } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")) {
       s.attack(306, 308, "kickUp");
     } else if (downKeys['f'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick2")) {
       s.attack(328, 332, "kick2");
     //} else if (downKeys['g'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick3")) {
     //  s.attack(244, 247, "kick3");
     } else if (downKeys['f'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
       s.attack(399, 406, "flyKick");
     } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("spinningKick")) {
       s.attack(371, 380, "spinningKick");
     } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
       s.jumpMove(341, 343, "jump");
     } else if (downKeys['c'] && s.curMove.equals("") || s.curMove.equals("kamekameha")) {
       s.attack(352, 355, "kamekameha");
     } else {
       s.reset(297);
     }
  }
  if (s2.name == "Ryu"){
    if (downKeys2[256] && s2.curMove.equals("") || s2.curMove.equals("walkRight")) {
       s2.dir = 'r';
       s2.walkMove(300, 304, "walkRight");
     } else if (downKeys2[257] && s2.curMove.equals("") || s2.curMove.equals("walkLeft")) {
       s2.dir = 'l';
       s2.walkMove(300, 304, "walkLeft");
     } else if (downKeys2['n'] && downKeys['s'] && s2.curMove.equals("") || s2.curMove.equals("crouchKick")) {
       s2.crouchMove(309, 311, "crouchKick");
     } else if (downKeys2['m'] && downKeys['s'] && s2.curMove.equals("") || s2.curMove.equals("crouchKick2")) {
       s2.crouchMove(333, 338, "crouchKick2");
     } else if (downKeys2['j'] && downKeys['s'] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch")) {
       s2.crouchMove(320, 323, "crouchPunch");
     //} else if (downKeys2['k'] && downKeys['s'] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch2")) {
     //  s2.crouchMove(197, 200, "crouchPunch2");
     } else if (downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouch")) {
       s2.crouchMove(309, 309, "crouch");
     } else if (downKeys2['j'] && !downKeys['s'] && s2.curMove.equals("") || s2.curMove.equals("punchOne")) {
       s2.attack(317, 319, "punchOne");
     } else if (downKeys2['l'] && s2.curMove.equals("") || s2.curMove.equals("kickUp")) {
       s2.attack(306, 308, "kickUp");
     } else if (downKeys2['n'] && !downKeys['w'] && s2.curMove.equals("") || s2.curMove.equals("kick2")) {
       s2.attack(328, 332, "kick2");
     //} else if (downKeys2['m'] && !downKeys['w'] && s2.curMove.equals("") || s2.curMove.equals("kick3")) {
     //  s2.attack(244, 247, "kick3");
     } else if (downKeys2['n'] && s2.curMove.equals("") || s2.curMove.equals("flyKick")) {
       s2.attack(399, 406, "flyKick");
     } else if (downKeys2[','] && s.curMove.equals("") || s2.curMove.equals("spinningKick")) {
       s2.attack(371, 380, "spinningKick");
     } else if (downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("jump")) {
       s2.jumpMove(341, 343, "jump");
     } else if (downKeys2['.'] && s2.curMove.equals("") || s2.curMove.equals("kamekameha")) {
       s2.attack(352, 355, "kamekameha");
     } else {
       s2.reset(297);
     }
  }
  if (s.name == "Chun-li"){
    if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       s.dir = 'r';
       s.walkMove(300, 304, "walkRight");
     } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
       s.dir = 'l';
       s.walkMove(300, 304, "walkLeft");
     } else if (downKeys['f'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
       s.crouchMove(309, 311, "crouchKick");
     } else if (downKeys['h'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
       s.crouchMove(333, 338, "crouchKick2");
     } else if (downKeys['q'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
       s.crouchMove(320, 323, "crouchPunch");
     //} else if (downKeys['e'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch2")) {
     //  s.crouchMove(197, 200, "crouchPunch2");
     } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
       s.crouchMove(309, 309, "crouch");
     } else if (downKeys['q'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punchOne")) {
       s.attack(317, 319, "punchOne");
     } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")) {
       s.attack(306, 308, "kickUp");
     } else if (downKeys['f'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick2")) {
       s.attack(328, 332, "kick2");
     //} else if (downKeys['g'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick3")) {
     //  s.attack(244, 247, "kick3");
     } else if (downKeys['f'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
       s.attack(399, 406, "flyKick");
     } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("spinningKick")) {
       s.attack(371, 380, "spinningKick");
     } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
       s.jumpMove(341, 343, "jump");
     } else if (downKeys['c'] && s.curMove.equals("") || s.curMove.equals("kamekameha")) {
       s.attack(352, 355, "kamekameha");
     } else {
       s.reset(297);
     }
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
  if (hitboxRight(s, s2)) {
      if (s.state.equals("attack")) {
        beginHit(s2, s);
      }
  } 
  else if (hitboxLeft(s, s2)) {
      if (s.state.equals("attack")) {
        beginHit(s2, s);
      }
  }
}
// checks if Sprite s is within hitbox of Sprite s2 on the s's right side
boolean hitboxRight(Sprite s, Sprite s2) {
  float widthFactor = 0.73;
  return s.dir == 'l' &&
        s.getX() < s2.getX() + widthFactor * s2.getWidth() && 
        s.getX() > s2.getX() && 
        s.getY() >= s2.getY() && 
        s.getY() < s2.getY() + s2.getHeight();
}

// checks if Sprite s is within hitbox of Sprite s2 on the s's left side
boolean hitboxLeft(Sprite s, Sprite s2) {
  float widthFactor = 0.73;
  return s.dir == 'r' && 
        s.getX() > s2.getX() - widthFactor * s2.getWidth() && 
        s.getX() < s2.getX() &&
        s.getY() >= s2.getY() &&
        s.getY() < s2.getY() + s2.getHeight();
}

void beginHit(Sprite s, Sprite s2) {
  s.takeDamage(10);
  s.state = "getHit";
  if (s2.dir == 'r') {
    s.dir = 'l';
  } else {
    s.dir = 'r';
  }
}