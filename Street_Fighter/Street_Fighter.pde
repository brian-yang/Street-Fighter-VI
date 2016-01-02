Button menu, vs, training, challenge, customize, data, options, store, quit;
Button[] buttons;
String[] labels;
String currentScreen;
PImage bg;

void setup() {
  size (1024, 768);
  smooth();
  
  buttonSetup();
  buttonPlacement();
  currentScreen = "Menu";
  bg = loadImage("Background.png");
}

void draw() {
  if (currentScreen == "Menu") {
    background(bg);
    for (int i = 1; i < buttons.length; i++) {
      buttons[i].Draw();
    }
  } else if (currentScreen == "Versus") {
    background(0);
    buttons[0].Draw();
    buttons[8].Draw();
  }
}

void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].MouseIsOver()) {
      currentScreen = buttons[i].getLabel();  
    }
  }
}

void buttonSetup() {
  labels = new String[] {"Menu", "Versus", "Training", "Challenge", "Customize", "Data", "Option", "Store", "Quit"};
  buttons = new Button[] {menu, vs, training, challenge, customize, data, options, store, quit};
}

void buttonPlacement() {
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(labels[i], 100, 150 + i * 65, 300, 50);
  }
}