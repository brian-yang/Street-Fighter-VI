int numFrames = 4;
int counter = 0;
int moveVal= 10;
int currentFrame = 0;
int xpos, ypos;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(640, 360);
  frameRate(6);
 
  //images[0]  = loadImage("12.png");
  //images[1]  = loadImage("13.png"); 
  //images[2]  = loadImage("14.png");
  //images[3]  = loadImage("15.png"); 
 
  for (int i = 0; i < numFrames; i++) {
   String imageName = (i+12) + ".png";
   images[i] = loadImage(imageName);
  }
  xpos = 300;
  ypos = 150;
} 
 
void draw() { 
  background(0);
  currentFrame = (currentFrame+1) % numFrames;  
  if (counter < numFrames) {
    background(0);
    image(images[(currentFrame) % numFrames], xpos, ypos);
  }
  counter++;
  if (counter == numFrames) {
    counter = 0;
  }
}

void keyPressed(){
  if (keyCode == 'D'){
    xpos += moveVal;  
  }
}
