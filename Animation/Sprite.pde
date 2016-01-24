class Sprite {
    // x-y coords
    int x, y;
    // current move and name
    String name;
    String curMove;
    // frames
    int curFrame = 0;
    ArrayList < PImage > images;
    // states
    String state;
    boolean goingUp; // determines if fighter is jumping up
    char dir;
    // ===== CONSTANTS =====
    // movement
    int STEP = 8;
    int KNOCKBACK = 10;
    int ACCEL = 15;
    int CROUCH_STEP = 30;
    int UP_STEP = 0;
    int V_MAX = 0;
    // health
    float health = 1000;
    float MAX_HEALTH = 1000;
    // boundaries
    int LEFT_BOUND = 30; // xcor of left boundary
    int RIGHT_BOUND = width - 15; // xcor of right boundary

    Sprite(int x, int y, String name) {
        images = new ArrayList < PImage > ();
        for (int i = 0; i < 181; i++) {
            String imageName = "Cammy " + "(" + (i + 1) + ").png";
            images.add(loadImage(imageName));
        }
        for (int i = 0; i < 116; i++) {
            String imageName = "Ken " + "(" + (i + 1) + ").png";
            images.add(loadImage(imageName));
        }
        for (int i = 0; i < 133; i++) {
            String imageName = "Ryu " + "(" + (i + 1) + ").png";
            images.add(loadImage(imageName));
        }
        for (int i = 0; i < 107; i++) {
            String imageName = "Chun-li " + "(" + (i + 1) + ").png";
            images.add(loadImage(imageName));
        }
        for (PImage i: images){
          i.resize((int) (i.width * 1.5),(int) (i.height * 1.5));
        }
        this.x = x;
        this.y = y;
        this.name = name;
        curMove = "";
        curFrame = 0;
        state = "";
        goingUp = false;
    }
    
    float getX() {
      return x;
    }
    
    float getY() {
      return y;
    }
    
    float getWidth(){
      return images.get(curFrame).width;
    }

    float getHeight(){
      return images.get(curFrame).height;
    }
    
    void takeDamage(int damage) {
      if (health - damage > 0) {
        health -= damage;
      } else {
        health = 0;
      }
    }
   
    void reset(int resetFrame) {
        curFrame = resetFrame;
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y);
        }
    }

    void walkMove(int startFrame, int endFrame, String moveName) {
        state = "walk";
        if (!curMove.equals(moveName)) {
            curMove = moveName;
            curFrame = startFrame;
        }
        if (dir == 'l') {
            if (x - STEP >= LEFT_BOUND) {
              x -= STEP;
            }
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y);
            popMatrix();
        } else {
            if (x + STEP <= RIGHT_BOUND) {
              x += STEP;
            }
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
            state = "";
        }
    }

    void getHit(int startFrame, int endFrame, String getHitName) {
        state = "getHit";
        if (!curMove.equals(getHitName)) {
            curMove = getHitName;
            curFrame = startFrame;
        }
        if (dir == 'l') {
            if (x + KNOCKBACK <= RIGHT_BOUND) {
              x += KNOCKBACK;
            }
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y);
        } else {
            if (x - KNOCKBACK >= LEFT_BOUND) {
              x -= KNOCKBACK;
            }
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y);
            popMatrix();
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
            state = "";
        }
    }

    void jumpMove(int startFrame, int endFrame, String jumpName) {
        // checks if curMove has already been set to this attack
        if (jumpName.equals("jump")) {
          state = "jump";
        } else {
          state = "attack";
        }
        if (!curMove.equals(jumpName)) {
            goingUp = true;
            curMove = jumpName;
            curFrame = startFrame;
            V_MAX = (endFrame - startFrame) * ACCEL;
        }
        if (goingUp) {
          UP_STEP += ACCEL;
          y -= UP_STEP;
        } else {
          UP_STEP -= ACCEL;
          y -= UP_STEP;
        }
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y);
        }
        if (goingUp) {
          curFrame++;
        } else {
          curFrame--;
        }
        if (curFrame >= endFrame && goingUp) {
            goingUp = false;
            UP_STEP = 0;
        } else if (UP_STEP <= V_MAX * -1 && !goingUp) {
            curMove = "";
            curFrame = 0;
            UP_STEP = 0;
        }
    }

    void crouchMove(int startFrame, int endFrame, String crouchName) {
        // checks if curMove has already been set to this attack
        if (crouchName.equals("crouch")) {
          state = "crouch";
        } else {
          state = "attack";
        }
        if (!curMove.equals(crouchName)) {
            curMove = crouchName;
            curFrame = startFrame;
            y += 2 * CROUCH_STEP - 20;
        }
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
            y -= 2 * CROUCH_STEP - 20;
            state = "";
        }
    }

    void attack(int startFrame, int endFrame, String attackName) {
        // checks if curMove has already been set to this attack
        state = "attack";
        if (!curMove.equals(attackName)) {
            curMove = attackName;
            curFrame = startFrame;
        }
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
            state = "";
        }
    }

}