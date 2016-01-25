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
    timer = new Timer(60);
    p = new Sprite(300, width / 2, fighter1);
    q = new Sprite(700, width / 2, fighter2);
    q.dir = 'l';
  }

  void run(boolean[] keys, boolean[] keys2) {
    // Timer
    timer.run();
    
    // Health
    makeHealthBar(p, 80, 90);
    makeHealthBar(q, width - 380, 90);

    // Fighters
    action(p, keys, q, keys2);
    hitbox(p, q);
    hitbox(q, p);
  }
  
void action(Sprite s, boolean[] downKeys, Sprite s2, boolean[] downKeys2) {
  // P1
   if (s.name.equals("Cammy")) {
    if (s2.health <= 0 && s.curMove.equals("") || s.curMove.equals("victory")){
      s.victory(171, 176, "victory");
    } 
    if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")){
      s.getHit(106, 108, "getHit");
    } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
      s.dir = 'r';
      s.walkMove(0, 5, "walkRight");
    } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
      s.dir = 'l'; 
      s.walkMove(0, 5, "walkLeft");
    } else if (downKeys['f'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
      s.crouchMove(36, 37, "crouchKick");
    } else if (downKeys['g'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
      s.crouchMove(38, 41, "crouchKick2");
    } else if (downKeys['q'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
      s.crouchMove(42, 43, "crouchPunch");
    } else if (downKeys['e'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch2")) {
      s.crouchMove(44, 46, "crouchPunch2");
    } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
      s.crouchMove(21, 21, "crouch");
    } else if (downKeys['q'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punch")) {
      s.attack(16, 17, "punch");
    } else if (downKeys['e'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punch2")) {
      s.attack(18, 19, "punch2");
    } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")) {
      s.attack(20, 24, "kickUp");
    } else if (downKeys['f'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick")) {
      s.attack(25, 26, "kick");
    } else if (downKeys['g'] && s.curMove.equals("") || s.curMove.equals("kick2")) {
      s.attack(27, 29, "kick2");
    } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("spinningKnuckle")) {
      s.attack(30, 33, "spinningKnuckle");
    } else if (downKeys['f'] && downKeys['w'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
      s.jumpMove(53, 54, "flyKick", false);
    } else if (downKeys['h'] && s.curMove.equals("") || s.curMove.equals("flyKick2")) {
     s.attack(80, 85, "flyKick2");
    } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
      if (downKeys['a']) { // either or - not both
        s.dir = 'l';
        s.jumpMove(47, 52, "jump", true);
      } else if (downKeys['d']) {
        s.dir = 'r';
        s.jumpMove(47, 52, "jump", true);
      } else {
        s.jumpMove(47, 52, "jump", false);
      }
    } else {
      s.reset(6);
    }
  }
 if (s.name.equals("Ken")) {
     if (s2.health <= 0 && s.curMove.equals("") || s.curMove.equals("victory")){
       s.victory(181, 183, "victory");
     } 
     if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")){
       s.getHit(226, 228, "getHit");
     } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       s.dir = 'r';
       s.walkMove(181, 186, "walkRight");
     } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
       s.dir = 'l';
       s.walkMove(181, 186, "walkLeft");
     } else if (downKeys['f'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
       s.crouchMove(188, 190, "crouchKick");
     } else if (downKeys['g'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
       s.crouchMove(191, 196, "crouchKick2");
     } else if (downKeys['q'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
       s.crouchMove(197, 200, "crouchPunch");
     } else if (downKeys['e'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch2")) {
      s.crouchMove(204, 207, "crouchPunch2");
     } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
       s.crouchMove(187, 187, "crouch");
     } else if (downKeys['q'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punch")) {
       s.attack(201, 203, "punch");
     //} else if (downKeys['e'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punch2")) {
     //  s.attack(201, 203, "punch2");
     } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")) {
       s.attack(215, 217, "kickUp");
     } else if (downKeys['f'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick")) {
       s.attack(218, 225, "kick");
     } else if (downKeys['g'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick2")) {
       s.attack(244, 247, "kick2");
     } else if (downKeys['z'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
       s.attack(254, 257, "flyKick");
     } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("spinningKick")) {
       s.attack(258, 267, "spinningKick");
     } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
      if (downKeys['a']) { // either or - not both
        s.dir = 'l';
        s.jumpMove(229, 232, "jump", true);
      } else if (downKeys['d']) {
        s.dir = 'r';
        s.jumpMove(229, 232, "jump", true);
      } else {
        s.jumpMove(229, 232, "jump", false);
      }
     } else if (downKeys['c'] && s.curMove.equals("") || s.curMove.equals("kamekameha")) {
       s.attack(240, 243, "kamekameha");
     } else {
       s.reset(181);
     }
  }
   if (s.name.equals("Ryu")){
     if (s2.health <= 0 && s.curMove.equals("") || s.curMove.equals("victory")){
       s.victory(418, 420, "victory");
     }
     if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")){
       s.getHit(312, 314, "getHit");
     } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       s.dir = 'r';
       s.walkMove(300, 304, "walkRight");
     } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
       s.dir = 'l';
       s.walkMove(300, 304, "walkLeft");
     } else if (downKeys['f'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
       s.crouchMove(309, 311, "crouchKick");
     } else if (downKeys['g'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
       s.crouchMove(333, 338, "crouchKick2");
     } else if (downKeys['q'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
       s.crouchMove(320, 323, "crouchPunch");
     //} else if (downKeys['e'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch2")) {
     //  s.crouchMove(197, 200, "crouchPunch2");
     } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
       s.crouchMove(309, 309, "crouch");
     } else if (downKeys['q'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punch")) {
       s.attack(317, 319, "punch");
     //} else if (downKeys['e'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punch2")) {
     //  s.crouchMove(197, 200, "punch2");
     } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")) {
       s.attack(306, 308, "kickUp");
     } else if (downKeys['f'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick")) {
       s.attack(328, 332, "kick");
     //} else if (downKeys['g'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick2")) {
     //  s.attack(244, 247, "kick2");
     } else if (downKeys['z'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
       s.attack(399, 406, "flyKick");
     } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("spinningKick")) {
       s.attack(371, 380, "spinningKick");
     } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
      if (downKeys['a']) { // either or - not both
        s.dir = 'l';
        s.jumpMove(341, 343, "jump", true);
      } else if (downKeys['d']) {
        s.dir = 'r';
        s.jumpMove(341, 343, "jump", true);
      } else {
        s.jumpMove(341, 343, "jump", false);
      }
     } else if (downKeys['c'] && s.curMove.equals("") || s.curMove.equals("kamekameha")) {
       s.attack(352, 355, "kamekameha");
     } else {
       s.reset(297);
     }
  }
  if (s.name.equals("Chun-li")){
    if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       s.dir = 'r';
       s.walkMove(433, 437, "walkRight");
     }if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
       s.dir = 'l';
       s.walkMove(433, 437, "walkLeft");
     } else if (downKeys['f'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick")) {
       s.crouchMove(454, 457, "crouchKick");
     } else if (downKeys['g'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchKick2")) {
      s.crouchMove(470, 471, "crouchKick2");
     } else if (downKeys['q'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch")) {
       s.crouchMove(462, 463, "crouchPunch");
     //} else if (downKeys['e'] && downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouchPunch2")) {
     //  s.crouchMove(197, 200, "crouchPunch2");
     } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("crouch")) {
       s.crouchMove(473, 473, "crouch");
     } else if (downKeys['q'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punch")) {
       s.attack(460, 461, "punch");
     } else if (downKeys['e'] && !downKeys['s'] && s.curMove.equals("") || s.curMove.equals("punch2")) {
       s.attack(464, 465, "punch2");
     } else if (downKeys['r'] && s.curMove.equals("") || s.curMove.equals("kickUp")) {
       s.attack(466, 469, "kickUp");
     } else if (downKeys['f'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick")) {
       s.attack(451, 453, "kick");
     } else if (downKeys['g'] && !downKeys['w'] && s.curMove.equals("") || s.curMove.equals("kick2")) {
       s.attack(485, 493, "kick2");
     } else if (downKeys['z'] && s.curMove.equals("") || s.curMove.equals("flyKick")) {
       s.attack(502, 512, "flyKick");
     } else if (downKeys['x'] && s.curMove.equals("") || s.curMove.equals("spinningKick")) {
       s.attack(477, 484, "spinningKick");
     } else if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("jump")) {
      if (downKeys['a']) { // either or - not both
        s.dir = 'l';
        s.jumpMove(537, 543, "jump", true);
      } else if (downKeys['d']) {
        s.dir = 'r';
        s.jumpMove(537, 543, "jump", true);
      } else {
        s.jumpMove(537, 543, "jump", false);
      }
     } else if (downKeys['c'] && s.curMove.equals("") || s.curMove.equals("kamekameha")) {
       s.specialAttack(529, 536, "kamekameha");
     } else if (downKeys['t'] && s.curMove.equals("") || s.curMove.equals("combo")) {
       s.attack(513, 521, "combo");
     } else {
       s.reset(430);
     }
  }
  // P2
  if (s2.name.equals("Cammy")) {
    if (s.health <= 0 && s.curMove.equals("") || s.curMove.equals("victory")){
      s.victory(171, 176, "victory");
    }
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
    } else if (downKeys2['j'] && !downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("punch")) {
      s2.attack(16, 17, "punch");
    } else if (downKeys2['k'] && !downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("punch2")) {
      s2.attack(18, 19, "punch2");
    } else if (downKeys2['l'] && s2.curMove.equals("") || s2.curMove.equals("kickUp")) {
      s2.attack(20, 24, "kickUp");
    } else if (downKeys2['n'] && !downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("kick")) {
      s2.attack(25, 26, "kick");
    } else if (downKeys2['m'] && s2.curMove.equals("") || s2.curMove.equals("kick2")) {
      s2.attack(27, 29, "kick2");
    } else if (downKeys2[','] && s2.curMove.equals("") || s2.curMove.equals("spinningKnuckle")) {
      s2.attack(30, 33, "spinningKnuckle");
    } else if (downKeys2['n'] && downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("flyKick")) {
      s2.jumpMove(53, 54, "flyKick", false);
    //} else if (downKeys2['m'] && downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("flyKick2")) {
    //  s2.jumpMove(53, 54, "flyKick2");
    } else if (downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("jump")) {
      if (downKeys2[256]) { // either or - not both
        s2.dir = 'r';
        s2.jumpMove(47, 52, "jump", true);
      } else if (downKeys2[257]) {
        s2.dir = 'l';
        s2.jumpMove(47, 52, "jump", true);
      } else {
        s2.jumpMove(47, 52, "jump", false);
      }
    } else {
      s2.reset(6);
    }
  }
  if (s2.name.equals("Ken")) {
     if (s2.state.equals("getHit") && s2.curMove.equals("") || s2.curMove.equals("getHit")){
       s2.getHit(226, 228, "getHit");
     } else if (downKeys2[256] && s2.curMove.equals("") || s2.curMove.equals("walkRight")) {
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
     } else if (downKeys2['k'] && downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch2")) {
      s2.crouchMove(204, 207, "crouchPunch2");
     } else if (downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouch")) {
       s2.crouchMove(187, 187, "crouch");
     } else if (downKeys2['j'] && !downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("punch")) {
       s2.attack(201, 203, "punch");
     //} else if (downKeys2['e'] && !downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("punch2")) {
     //  s2.attack(201, 203, "punch2");
     } else if (downKeys2['l'] && s2.curMove.equals("") || s2.curMove.equals("kickUp")) {
       s2.attack(215, 217, "kickUp");
     } else if (downKeys2['n'] && !downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("kick")) {
       s2.attack(218, 225, "kick");
     } else if (downKeys2['m'] && !downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("kick2")) {
       s2.attack(244, 247, "kick2");
     } else if (downKeys2['/'] && s2.curMove.equals("") || s2.curMove.equals("flyKick")) {
       s2.attack(254, 257, "flyKick");
     } else if (downKeys2[','] && s2.curMove.equals("") || s2.curMove.equals("spinningKick")) {
       s2.attack(258, 267, "spinningKick");
     } else if (downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("jump")) {
      if (downKeys2[256]) { // either or - not both
        s2.dir = 'r';
        s2.jumpMove(229, 232, "jump", true);
      } else if (downKeys2[257]) {
        s2.dir = 'l';
        s2.jumpMove(229, 232, "jump", true);
      } else {
        s2.jumpMove(229, 232, "jump", false);
      }
     } else if (downKeys2['.'] && s2.curMove.equals("") || s2.curMove.equals("kamekameha")) {
       s2.attack(240, 243, "kamekameha");
     } else {
       s2.reset(181);
     }
  }
  if (s2.name.equals("Ryu")){
     if (s2.state.equals("getHit") && s2.curMove.equals("") || s2.curMove.equals("getHit")){
       s2.getHit(312, 314, "getHit");
     } else if (downKeys2[256] && s2.curMove.equals("") || s2.curMove.equals("walkRight")) {
       s2.dir = 'r';
       s2.walkMove(300, 304, "walkRight");
     } else if (downKeys2[257] && s2.curMove.equals("") || s2.curMove.equals("walkLeft")) {
       s2.dir = 'l';
       s2.walkMove(300, 304, "walkLeft");
     } else if (downKeys2['n'] && downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("crouchKick")) {
       s2.crouchMove(309, 311, "crouchKick");
     } else if (downKeys2['m'] && downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("crouchKick2")) {
       s2.crouchMove(333, 338, "crouchKick2");
     } else if (downKeys2['j'] && downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch")) {
       s2.crouchMove(320, 323, "crouchPunch");
     //} else if (downKeys2['k'] && downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch2")) {
     //  s2.crouchMove(197, 200, "crouchPunch2");
     } else if (downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouch")) {
       s2.crouchMove(309, 309, "crouch");
     } else if (downKeys2['j'] && !downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("punchOne")) {
       s2.attack(317, 319, "punchOne");
     //} else if (downKeys2['k'] && downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("punch2")) {
     //  s2.crouchMove(197, 200, "punch2");
     } else if (downKeys2['l'] && s2.curMove.equals("") || s2.curMove.equals("kickUp")) {
       s2.attack(306, 308, "kickUp");
     } else if (downKeys2['n'] && !downKeys2['w'] && s2.curMove.equals("") || s2.curMove.equals("kick")) {
       s2.attack(328, 332, "kick");
     //} else if (downKeys2['m'] && !downKeys2['w'] && s2.curMove.equals("") || s2.curMove.equals("kick2")) {
     //  s2.attack(244, 247, "kick2");
     } else if (downKeys2['/'] && s2.curMove.equals("") || s2.curMove.equals("flyKick")) {
       s2.attack(399, 406, "flyKick");
     } else if (downKeys2[','] && s2.curMove.equals("") || s2.curMove.equals("spinningKick")) {
       s2.attack(371, 380, "spinningKick");
     } else if (downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("jump")) {
      if (downKeys2[256]) { // either or - not both
        s2.dir = 'r';
        s2.jumpMove(341, 343, "jump", true);
      } else if (downKeys2[257]) {
        s2.dir = 'l';
        s2.jumpMove(341, 343, "jump", true);
      } else {
        s2.jumpMove(341, 343, "jump", false);
      }
     } else if (downKeys2['.'] && s2.curMove.equals("") || s2.curMove.equals("kamekameha")) {
       s2.attack(352, 355, "kamekameha");
     } else {
       s2.reset(297);
     }
  }
   if (s2.name.equals("Chun-li")){
    if (downKeys2[256] && s2.curMove.equals("") || s2.curMove.equals("walkRight")) {
       s2.dir = 'r';
       s2.walkMove(433, 437, "walkRight");
     } else if (downKeys2[257] && s2.curMove.equals("") || s2.curMove.equals("walkLeft")) {
       s2.dir = 'l';
       s2.walkMove(433, 437, "walkLeft");
     } else if (downKeys2[258] && downKeys2['n'] && s2.curMove.equals("") || s2.curMove.equals("crouchKick")) {
       s2.crouchMove(454, 457, "crouchKick");
     } else if (downKeys2[258] && downKeys2['m'] && s2.curMove.equals("") || s2.curMove.equals("crouchKick2")) {
       s2.crouchMove(470, 471, "crouchKick2");
     } else if (downKeys2[258] && downKeys2['j'] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch")) {
       s2.crouchMove(462, 463, "crouchPunch");
     //} else if (downKeys2[258] && downKeys2['k'] && s2.curMove.equals("") || s2.curMove.equals("crouchPunch2")) {
     //  s2.crouchMove(197, 200, "crouchPunch2");
     } else if (downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("crouch")) {
       s2.crouchMove(473, 473, "crouch");
     } else if (downKeys2['j'] && !downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("punch")) {
       s2.attack(460, 461, "punch");
     } else if (downKeys2['k'] && !downKeys2['s'] && s2.curMove.equals("") || s2.curMove.equals("punch2")) {
       s2.attack(464, 465, "punch2");
     } else if (downKeys2['l'] && s2.curMove.equals("") || s2.curMove.equals("kickUp")) {
       s2.attack(466, 469, "kickUp");
     } else if (downKeys2['n'] && !downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("kick")) {
       s2.attack(451, 453, "kick");
     } else if (downKeys2['m'] && !downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("kick2")) {
       s2.attack(485, 493, "kick2");
     } else if (downKeys2['/'] && s2.curMove.equals("") || s2.curMove.equals("flyKick")) {
       s2.attack(502, 512, "flyKick");
     } else if (downKeys2[','] && s2.curMove.equals("") || s2.curMove.equals("spinningKick")) {
       s2.attack(477, 484, "spinningKick");
     } else if (downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("jump")) {
      if (downKeys2[256]) { // either or - not both
        s2.dir = 'r';
        s2.jumpMove(537, 543, "jump", true);
      } else if (downKeys2[257]) {
        s2.dir = 'l';
        s2.jumpMove(537, 543, "jump", true);
      } else {
        s2.jumpMove(537, 543, "jump", false);
      }
     } else if (downKeys2['.'] && s2.curMove.equals("") || s2.curMove.equals("kamekameha")) {
       s2.specialAttack(529, 536, "kamekameha");
     } else if (downKeys2['p'] && s2.curMove.equals("") || s2.curMove.equals("combo")) {
       s2.attack(513, 521, "combo");
     } else {
       s2.reset(430);
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
  s.takeDamage(100);
  s.state = "getHit";
  if (s2.dir == 'r') {
    s.dir = 'l';
  } else {
    s.dir = 'r';
  }
}
}