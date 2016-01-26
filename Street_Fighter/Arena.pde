class Arena extends Screen {
    PFont font;
    Timer timer;
    Sprite p;
    Sprite q;
    PlayerOne p1;
    PlayerTwo p2;
    String winner;


    Arena(String bg) {
        super(bg);
        isSetUp = true;
    }

    void initialize(String fighter1, boolean[] downKeys, String fighter2, boolean[] downKeys2) {
        // initialize arena
        font = loadFont("ShowcardGothic-Reg-48.vlw");
        timer = new Timer(62); // actually starts at 60 seconds because timer is slightly off
        p = new Sprite(300, width / 2, fighter1);
        q = new Sprite(700, width / 2, fighter2);
        q.dir = 'l';
        p1 = new PlayerOne(p, downKeys);
        p2 = new PlayerTwo(q, downKeys2);
        winner = "";
    }

    void run(int players) {
        // Stylize screen
        stylize();
      
        // Timer
        runTimer();

        // Health
        makeHealthBar(p, 80, 90);
        makeHealthBar(q, width - 380, 90);
        
        // Fighters
        p1.action(q);
        if (players == 2) {
            p2.action(p);
        } else {
            freeze(q);
        }
        hitbox(p, q);
        hitbox(q, p);
    }

    void stylize() {
        textFont(font);
        textSize(60);
        fill(#2EB73D);
        text(fighter1, width/2 - 280, height / 2 - 220);
        text(fighter2, width/2 + 280, height / 2 - 220);
    }

    void runTimer() {
        if (p.health <= 0 || q.health <= 0 || timer.interval - timer.time <= 0) {
          if (winner.isEmpty()) {
            timer.reset(); // calls reset to start 3-second countdown before switch to main menu
          }
          timer.stop();
          if (q.health <= 0) {
            winner = "Player 1";
          } else if (p.health <= 0) {
            winner = "Player 2";
          } else {
            winner = "Tie";
          }
        } else {
          timer.run();
        }
    }

    void freeze(Sprite s) {
        if (s.name.equals("Cammy")) {
            if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")) {
                s.getHit(106, 108, "getHit");
            } else {
                s.reset(6);
            }
        } else if (s.name.equals("Ken")) {
            if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")) {
                s.getHit(226, 228, "getHit");
            } else {
                s.reset(181);
            }
        } else if (s.name.equals("Ryu")) {
            if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")) {
                s.getHit(312, 314, "getHit");
            } else {
                s.reset(297);
            }
        } else if (s.name.equals("Chun-li")) {
            if (s.state.equals("getHit") && s.curMove.equals("") || s.curMove.equals("getHit")) {
                s.getHit(445, 445, "getHit");
            } else {
                s.reset(430);
            }
        }
    }


    void makeHealthBar(Sprite s, int x, int y) {
        float rectWidth = 300;
        if (s.health < 0.25 * s.MAX_HEALTH) {
            fill(255, 0, 0);
        } else if (s.health < 0.4 * s.MAX_HEALTH) {
            fill(255, 200, 0);
        } else {
            fill(0, 255, 0);
        }

        noStroke();
        float drawWidth = (s.health / s.MAX_HEALTH) * rectWidth;
        rect(x, y, drawWidth, 40, 50);

        stroke(0);
        noFill();
        rect(x, y, rectWidth, 40, 50);
    }
    void hitbox(Sprite s, Sprite s2) {
            if (hitboxRight(s, s2)) {
                if (s.state.equals("attack")) {
                    beginHit(s2, s);
                }
            } else if (hitboxLeft(s, s2)) {
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