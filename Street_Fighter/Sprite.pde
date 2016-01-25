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
    char dir;
    // ===== CONSTANTS =====
    // movement
    int STEP = 8;
    int KNOCKBACK = 10;
    int ACCEL = 20;
    int CROUCH_STEP = 30;
    int UP_STEP = 0;
    // health
    float health = 1000;
    float MAX_HEALTH = 1000;
    // boundaries
    int LEFT_BOUND = 30; // xcor of left boundary
    int RIGHT_BOUND = width - 15; // xcor of right boundary

    Sprite(int x, int y, String name) {
        images = new ArrayList < PImage > ();
        for (int i = 0; i < 181; i++) {
            String imageName = "../Animation/Cammy/Cammy " + "(" + (i + 1) + ").png";
            images.add(loadImage(imageName));
        }
        for (int i = 0; i < 116; i++) {
            String imageName = "../Animation/Ken/Ken " + "(" + (i + 1) + ").png";
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
        state = "";
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
        }
    }

    void jumpMove(int startFrame, int endFrame, String jumpName) {
        // checks if curMove has already been set to this attack
        if (jumpName.equals("inAir")) {
          state = "inAir";
        } else {
          state = "attack";
        }        
        if (!curMove.equals(jumpName)) {
            curMove = jumpName;
            curFrame = startFrame;
        }
        UP_STEP += ACCEL;
        // checks if character is facing left
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y - UP_STEP);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y - UP_STEP);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            UP_STEP = 0;
            curFrame = 0;
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
        }
        // checks if character is facing left
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y + 2 * CROUCH_STEP - 20);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y + 2 * CROUCH_STEP - 20);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
        }
    }
    
    void getHit(int startFrame, int endFrame, String getHitName) {
        state = "getHit";
        if (!curMove.equals(getHitName)) {
            curMove = getHitName;
            curFrame = startFrame;
        }
        // checks if character is facing left
        if (dir == 'r') {
            if (x - KNOCKBACK >= LEFT_BOUND) {
              x -= KNOCKBACK;
            }
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y);
            popMatrix();
        } else {
            if (x + KNOCKBACK <= RIGHT_BOUND) {
              x += KNOCKBACK;
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


    void attack(int startFrame, int endFrame, String attackName) {
        // checks if curMove has already been set to this attack
        state = "attack";
        if (!curMove.equals(attackName)) {
            curMove = attackName;
            curFrame = startFrame;
        }
        // checks if character is facing left
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
        }
    }

}