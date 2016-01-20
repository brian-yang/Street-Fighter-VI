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
    boolean crouching, inAir, walking, attacking, gettingHit;
    char dir;
    // how much should the sprite move
    int step = 3;
    int upStepInc = 20;
    int crouchStep = 30;
    int upStep = 0;
    // health
    float health = 1000;
    float MAX_HEALTH = 1000;
    // constants
    int smoothConstant = 40; // makes turning smoother
    int leftBound = 45; // xcor of left boundary
    int rightBound = width; // xcor of right boundary

    Sprite(int x, int y, String name) {
        images = new ArrayList < PImage > ();
        for (int i = 0; i < 181; i++) {
            String imageName = "../Animation/Cammy " + "(" + (i + 1) + ").png";
            images.add(loadImage(imageName));
        }
        for (int i = 0; i < 116; i++) {
            String imageName = "../Animation/Ken " + "(" + (i + 1) + ").png";
            images.add(loadImage(imageName));
        }
        this.x = x;
        this.y = y;
        this.name = name;
        curMove = "";
        curFrame = 0;
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
            image(images.get(curFrame), -(x + images.get(curFrame).width) + smoothConstant, y);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width, y);
        }
        crouching = false;
        inAir = false;
        walking = false;
        attacking = false;
        gettingHit = false;
    }

    void walkMove(int startFrame, int endFrame, String moveName) {
        walking = true;
        gettingHit = false;
        if (!curMove.equals(moveName)) {
            curMove = moveName;
            curFrame = startFrame;
        }
        if (dir == 'l') {
            if (x >= leftBound) {
              x -= step;
            }
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width) + smoothConstant, y);
            popMatrix();
        } else {
            if (x <= rightBound) {
              x += step;
            }
            image(images.get(curFrame), x - images.get(curFrame).width, y);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
        }
    }

    void jumpMove(int startFrame, int endFrame, String jumpName) {
        // checks if curMove has already been set to this attack
        inAir = true;
        if (!curMove.equals(jumpName)) {
            curMove = jumpName;
            curFrame = startFrame;
        }
        upStep += upStepInc;
        // checks if character is facing left
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width) + smoothConstant, y - upStep);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width, y - upStep);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            upStep = 0;
            curFrame = 0;
        }
    }

    void crouchMove(int startFrame, int endFrame, String crouchName) {
        // checks if curMove has already been set to this attack
        crouching = true;
        if (!curMove.equals(crouchName)) {
            curMove = crouchName;
            curFrame = startFrame;
        }
        // checks if character is facing left
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width) + smoothConstant, y + crouchStep);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width, y + crouchStep);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
        }
    }
    
    void getHit(int startFrame, int endFrame, String getHitName) {
        gettingHit = true;
        if (!curMove.equals(getHitName)) {
            curMove = getHitName;
            curFrame = startFrame;
        }
        // checks if character is facing left
        if (dir == 'r') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width) + smoothConstant, y);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width, y);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
            gettingHit = false;
        }
    }


    void attack(int startFrame, int endFrame, String attackName) {
        // checks if curMove has already been set to this attack
        attacking = true;
        if (!curMove.equals(attackName)) {
            curMove = attackName;
            curFrame = startFrame;
        }
        // checks if character is facing left
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width) + smoothConstant, y);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width, y);
        }
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
        }
    }

}