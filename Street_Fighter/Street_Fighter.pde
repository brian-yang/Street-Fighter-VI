Button menu, vs, training, challenge, customize, data, options, store, quit;
Button[] buttons;
String[] labels;
PImage bg;

void setup() {
  size (1024, 768);
  smooth();
  
  labels = new String[] {"Menu", "Versus", "Training", "Challenge", "Customize", "Data", "Option", "Store", "Quit"};
  buttons = new Button[] {menu, vs, training, challenge, customize, data, options, store, quit};
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(labels[i], 100, 50 + i * 75, 300, 50);
  }
  
  bg = loadImage("Background.png");
}

void draw() {
  background(bg);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].Draw();
  }
}

void mousePressed()
{}