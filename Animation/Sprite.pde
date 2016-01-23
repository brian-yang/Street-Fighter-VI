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
    boolean crouching, inAir;
    String state;
    char dir;
    // how much should the sprite move
    int step = 5;
    int upStepInc = 20;
    int crouchStep = 30;
    int upStep = 0;
    // health
    float health = 1000;
    float MAX_HEALTH = 1000;
    // constants
    int knockBack = 10;
    int leftBound = 30; // xcor of left boundary
    int rightBound = width - 15; // xcor of right boundary

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
        crouching = false;
        inAir = false;
        state = "";
    }

    void walkMove(int startFrame, int endFrame, String moveName) {
        state = "walk";
        if (!curMove.equals(moveName)) {
            curMove = moveName;
            curFrame = startFrame;
        }
        if (dir == 'l') {
            if (x - step >= leftBound) {
              x -= step;
            }
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y);
            popMatrix();
        } else {
            if (x + step <= rightBound) {
              x += step;
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
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y - upStep);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y - upStep);
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
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y + crouchStep);
            popMatrix();
        } else {
            image(images.get(curFrame), x - images.get(curFrame).width / 2, y + crouchStep);
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
            if (x - knockBack >= leftBound) {
              x -= knockBack;
            }
            pushMatrix();
            scale(-1, 1);
            image(images.get(curFrame), -(x + images.get(curFrame).width / 2), y);
            popMatrix();
        } else {
            if (x + knockBack <= rightBound) {
              x += knockBack;
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