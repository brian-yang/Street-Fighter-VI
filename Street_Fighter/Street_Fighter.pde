Button menu, vs, training, challenge, customize, data, options, store, quit;
Button[] buttons;
String[] labels;
String currentScreen;
ArrayList<Integer> screens;
PImage bg;

void setup() {
  size (1024, 768);
  smooth();
  buttonSetup();
  currentScreen = "Menu";
  bg = loadImage("Background.png");
  
  screens = new ArrayList<Integer>();
  for (int i = 0; i < buttons.length; i++) {
    screens.add(i);
  }
}

void draw() {
  if (currentScreen == "Menu") {
    background(bg);
    screens.remove(Integer.valueOf(0));
    buttonPlacement(100, 150, 75, "vertical");
  } else if (currentScreen == "Versus") {
    background(0);
    PImage test = loadImage("0.png");
    test.resize(100, 100);
    image(test, 100, 100);
    buttonPlacement(0, 0, 50, "horizontal");
  }
  for (int i = 0; i < buttons.length; i++) {
    if (!screens.contains(i)) {
      screens.add(i);
    }
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
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(labels[i], 300, 50);
  }
}

void buttonPlacement(float startX, float startY, float spacing, String mode) {
  for (Integer I : screens) {
    buttons[I].Draw();
    if (mode.equals("horizontal")) {
      buttons[I].setXY(startX + I * spacing, startY);
    } else if (mode.equals("vertical")) {
      buttons[I].setXY(startX, startY + I * spacing);
    }
  }
}