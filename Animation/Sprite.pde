class Sprite {
    // x-y coords
    int x, y;
    // current move and name
    String name;
    String curMove;
    // frames
    int walkFrame = 0;
    int jumpFrame = 0;
    int attackFrame = 0;
    int crouchFrame = 0;
    int resetFrame = 0;
    ArrayList < PImage > images;
    // states
    boolean crouching, inAir, walking, attacking;
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
            String imageName = "Cammy " + "(" + (i + 1) + ").png";
            images.add(loadImage(imageName));
        }
        for (int i = 0; i < 116; i++) {
            String imageName = "Ken " + "(" + (i + 1) + ").png";
            images.add(loadImage(imageName));
        }
        this.x = x;
        this.y = y;
        this.name = name;
        curMove = "";
        //resetFrame = 0;
    }
    
    float getX() {
      return x;
    }
    
    float getY() {
      return y;
    }
    
    float getWidth(){
      if (walkFrame!= 0){
        return images.get(walkFrame).width;
      }
      if (jumpFrame!= 0){
        return images.get(jumpFrame).width;
      }
      if (attackFrame!= 0){
        return images.get(attackFrame).width;
      }
      if (crouchFrame!= 0){
        return images.get(crouchFrame).width;
      }
      else {
        return (images.get(resetFrame).width);
      }
    }

    float getHeight(){
    if (walkFrame!= 0){
       return images.get(walkFrame).height;
     }
     if (jumpFrame!= 0){
       return images.get(jumpFrame).height;
     }
     if (attackFrame!= 0){
       return images.get(attackFrame).height;
     }
     if (crouchFrame!= 0){
       return images.get(crouchFrame).height;
     }
     else {
       return images.get(resetFrame).height;
     }
    }
    
    void takeDamage(int damage) {
      if (health - damage > 0) {
        health -= damage;
      } else {
        health = 0;
      }
    }
   
    void reset(int resetFrame) {
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(resetFrame), -(x + images.get(resetFrame).width) + smoothConstant, y);
            popMatrix();
        } else {
            image(images.get(resetFrame), x - images.get(resetFrame).width, y);
        }
        crouching = false;
        inAir = false;
        walking = false;
        attacking = false;
    }

    void walkMove(int startFrame, int endFrame, String moveName) {
        walking = true;
        if (!curMove.equals(moveName)) {
            curMove = moveName;
            walkFrame = startFrame;
        }
        if (dir == 'l') {
            if (x >= leftBound) {
              x -= step;
            }
            pushMatrix();
            scale(-1, 1);
            image(images.get(walkFrame), -(x + images.get(walkFrame).width) + smoothConstant, y);
            popMatrix();
        } else {
            if (x <= rightBound) {
              x += step;
            }
            image(images.get(walkFrame), x - images.get(walkFrame).width, y);
        }
        walkFrame++;
        if (walkFrame > endFrame) {
            curMove = "";
            walkFrame = 0;
        }
    }

    void jumpMove(int startFrame, int endFrame, String jumpName) {
        // checks if curMove has already been set to this attack
        inAir = true;
        if (!curMove.equals(jumpName)) {
            curMove = jumpName;
            jumpFrame = startFrame;
        }
        upStep += upStepInc;
        // checks if character is facing left
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(jumpFrame), -(x + images.get(jumpFrame).width) + smoothConstant, y - upStep);
            popMatrix();
        } else {
            image(images.get(jumpFrame), x - images.get(walkFrame).width, y - upStep);
        }
        jumpFrame++;
        if (jumpFrame > endFrame) {
            curMove = "";
            upStep = 0;
            jumpFrame = 0;
        }
    }

    void crouchMove(int startFrame, int endFrame, String crouchName) {
        // checks if curMove has already been set to this attack
        crouching = true;
        if (!curMove.equals(crouchName)) {
            curMove = crouchName;
            crouchFrame = startFrame;
        }
        // checks if character is facing left
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(crouchFrame), -(x + images.get(crouchFrame).width) + smoothConstant, y + crouchStep);
            popMatrix();
        } else {
            image(images.get(crouchFrame), x - images.get(walkFrame).width, y + crouchStep);
        }
        crouchFrame++;
        if (crouchFrame > endFrame) {
            curMove = "";
            crouchFrame = 0;
        }
    }


    void attack(int startFrame, int endFrame, String attackName) {
        // checks if curMove has already been set to this attack
        attacking = true;
        if (!curMove.equals(attackName)) {
            curMove = attackName;
            attackFrame = startFrame;
        }
        // checks if character is facing left
        if (dir == 'l') {
            pushMatrix();
            scale(-1, 1);
            image(images.get(attackFrame), -(x + images.get(attackFrame).width) + smoothConstant, y);
            popMatrix();
        } else {
            image(images.get(attackFrame), x - images.get(walkFrame).width, y);
        }
        attackFrame++;
        if (attackFrame > endFrame) {
            curMove = "";
            attackFrame = 0;
        }
    }

}