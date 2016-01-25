class Arena extends Screen {
  Timer timer;
  Sprite p;
  Sprite q;

  
  Arena(String bg) {
    super(bg);
    isSetUp = true;
  }
  
  void initialize(String fighter1, String fighter2) {
    // initialize arena
    timer = new Timer(99);
    p = new Sprite(500, width / 2, fighter1);
    q = new Sprite(500, width / 2, fighter2);
    q.dir = 'l';
  }

  void run(boolean[] keys, boolean[] keys2) {
    // Timer
    timer.run();
    
    // Health
    makeHealthBar(p, 80, 90);
    makeHealthBar(q, width - 380, 90);

    // Fighters
    actionP1(p, keys);
    actionP2(q, keys2);
    hitbox(p, q);
    hitbox(q, p);
  }
  
void actionP1(Sprite s, boolean[] downKeys) {
  // P1
  if (s.name.equals("Cammy")) {
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
  if (s.name.equals("Ken")) {
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
}

void actionP2(Sprite s2, boolean[] downKeys2) {
  // P2
  if (s2.name.equals("Cammy")) {
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
  if (s2.name.equals("Ken")) {
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
}
  void makeHealthBar(Sprite s, int x, int y){
    float rectWidth = 300;
    if (s.health < 0.25 * s.MAX_HEALTH){
      fill(255, 0, 0);
    } else if (s.health < 0.4 *s.MAX_HEALTH){
      fill(255, 200, 0);
    } else{
      fill(0, 255, 0);
    }
     
    noStroke();
    float drawWidth = (s.health / s.MAX_HEALTH) * rectWidth;
    rect(x, y, drawWidth, 40, 50);
     
    stroke(0);
    noFill();
    rect(x, y, rectWidth, 40, 50);
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
}