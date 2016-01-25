class PlayerTwo {
    Sprite s2;
    boolean[] downKeys2;

    PlayerTwo(Sprite s2, boolean[] commands) {
        this.s2 = s2;
        downKeys2 = commands;
    }

    void action(Sprite s) {
        // P2
        if (s2.name.equals("Cammy")) {
            if (s.health <= 0 && s.curMove.equals("") || s.curMove.equals("victory")) {
                s.victory(171, 176, "victory");
            } else if (s2.state.equals("getHit") && s2.curMove.equals("") || s2.curMove.equals("getHit")) {
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
            if (s.health <= 0 && s2.curMove.equals("") || s2.curMove.equals("victory")) {
                s2.victory(181, 183, "victory");
            } else if (s2.state.equals("getHit") && s2.curMove.equals("") || s2.curMove.equals("getHit")) {
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
        if (s2.name.equals("Ryu")) {
            if (s.health <= 0 && s2.curMove.equals("") || s2.curMove.equals("victory")){
                s2.victory(418, 420, "victory");
            } else if (s2.state.equals("getHit") && s2.curMove.equals("") || s2.curMove.equals("getHit")) {
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
        // VICTORY SCREEN FOR CHUN-LI
        if (s2.name.equals("Chun-li")) {
            if (s2.state.equals("getHit") && s2.curMove.equals("") || s2.curMove.equals("getHit")) {
                s2.getHit(445, 445, "getHit");
            } else if (downKeys2[256] && s2.curMove.equals("") || s2.curMove.equals("walkRight")) {
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
}