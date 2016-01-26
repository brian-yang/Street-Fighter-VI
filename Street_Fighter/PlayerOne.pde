class PlayerOne {
    Sprite s;
    boolean[] downKeys;

    PlayerOne(Sprite s, boolean[] commands) {
        this.s = s;
        downKeys = commands;
    }

    void action(Sprite s2) {
        // P1
        if (s.name.equals("Cammy")) {
            if (s2.health <= 0 && s.curMove.equals("") || s.curMove.equals("victory")) {
                s.victory(171, 176, "victory");
            } else if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")) {
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
            if (s2.health <= 0 && s.curMove.equals("") || s.curMove.equals("victory")) {
                s.victory(181, 183, "victory");
            } else if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")) {
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
        if (s.name.equals("Ryu")) {
            if (s2.health <= 0 && s.curMove.equals("") || s.curMove.equals("victory")){
                s.victory(418, 420, "victory");
            } else if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")) {
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
        
        if (s.name.equals("Chun-li")) {
            if (s2.health <= 0 && s.curMove.equals("") || s.curMove.equals("victory")){
                s.victory(438, 440, "victory");
            } else if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")) {
                s.getHit(445, 445, "getHit");
            } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
                s.dir = 'r';
                s.walkMove(433, 437, "walkRight");
            } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
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
    }
}