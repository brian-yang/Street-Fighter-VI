class Sprite{
  int x,y;
  int walkFrame = 0;
  int jumpFrame = 0;
  int attackFrame = 0;
  int crouchFrame = 0;
  ArrayList<PImage> images;
  char dir;
  int step = 5;
  int upStep = 0;
  String curMove = "";
  boolean crouching;
  boolean inAir;
  
  Sprite(int x, int y){
    images = new ArrayList<PImage>();
    for (int i = 0; i < 55; i++) {
      String imageName = "Cammy " + "(" + (i+1) + ").png";
      images.add(loadImage(imageName));
    }
    this.x = x;
    this.y = y;
  }
  
  void reset(){
    if (dir == 'l') {
      pushMatrix();
      scale(-1, 1);
      image(images.get(6),-(x + images.get(6).width),y);
      popMatrix();
    } else {
      image(images.get(6), x, y); 
    }
  }
  
  void walkLeft(){
    x -= step;
    pushMatrix();
    scale(-1, 1);
    image(images.get(walkFrame),-(x + images.get(walkFrame).width),y);
    popMatrix();
    walkFrame++;
    if (walkFrame > 5){
      walkFrame = 0;
    }
  }
  
  void walkRight(){
    x += step;
    image(images.get(walkFrame),x,y);
    walkFrame++;
    if (walkFrame > 5){
      walkFrame = 0;
    }
  }  

  void jumpMove(int startFrame, int endFrame, String jumpName) {
   inAir = true;
   // checks if curMove has already been set to this attack
   if (!curMove.equals(jumpName)) {
     curMove = jumpName;
     jumpFrame = startFrame;
   }
   upStep += 15;
   // checks if character is facing left
   if (dir == 'l') {
     pushMatrix();
     scale(-1, 1);
     image(images.get(jumpFrame), -(x + images.get(jumpFrame).width), y - upStep);
     popMatrix();
   } else {
     image(images.get(jumpFrame),x,y - upStep);
   }
   print (upStep + "/");
   jumpFrame++;
   if (jumpFrame > endFrame){
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
     image(images.get(crouchFrame), -(x + images.get(crouchFrame).width), y + 40);
     popMatrix();
   } else {
     image(images.get(crouchFrame),x,y + 40);
   }
   crouchFrame++;
   if (crouchFrame > endFrame){
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
      image(images.get(attackFrame), -(x + images.get(attackFrame).width), y);
      popMatrix();
    } else {
      image(images.get(attackFrame),x,y);
    }
    attackFrame++;
    if (attackFrame > endFrame){
      curMove = "";
    }
   }

}