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
    ArrayList < PImage > images;
    // states
    boolean crouching, inAir, walking;
    char dir;
    // how much should the sprite move
    int step = 10;
    int upStepInc = 20;
    int crouchStep = 30;
    int upStep = 0;
    int smoothConstant = 30; // tested constant

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
    }

    void walkMove(int startFrame, int endFrame, String moveName) {
        walking = true;
        if (!curMove.equals(moveName)) {
            curMove = moveName;
            walkFrame = startFrame;
        }
        if (dir == 'l') {
            x -= step;
            pushMatrix();
            scale(-1, 1);
            image(images.get(walkFrame), -(x + images.get(walkFrame).width) + smoothConstant, y);
            popMatrix();
        } else {
            x += step;
            image(images.get(walkFrame), x - images.get(walkFrame).width, y);
        }
        walkFrame++;
        if (walkFrame > endFrame) {
            curMove = "";
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
        }
    }


    void attack(int startFrame, int endFrame, String attackName) {
        // checks if curMove has already been set to this attack
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
        }
    }

}