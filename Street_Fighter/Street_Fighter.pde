// =======================================================================================================================
// DO NOT TOUCH
Button menu, vs, training, challenge, customize, data, options, store, quit;
Button[] BUTTONS = new Button[] {menu, vs, training, challenge, customize, data, options, store, quit};
String[] LABELS = new String[] {"Menu", "Versus", "Training", "Challenge", "Customize", "Data", "Option", "Store", "Quit"};
String currentScreen;
ArrayList<Integer> screens;
PImage bg;
// =======================================================================================================================

void setup() {
  size (1024, 768);
  smooth();
  buttonSetup();
  currentScreen = "Menu";
  bg = loadImage("Background.png");
  
  screens = new ArrayList<Integer>();
}

void draw() {
  if (currentScreen == "Menu") {
    background(bg);
    for (int i = 1; i < BUTTONS.length; i++) {
      screens.add(Integer.valueOf(i));
    }
    buttonPlacement(100, 125, 65, "vertical");
  } else if (currentScreen == "Versus") {
    background(0);
    screens.add(Integer.valueOf(0));
    screens.add(Integer.valueOf(BUTTONS.length - 1));
    buttonPlacement(300, 650, 50, "horizontal");
  }
  removeButtons();
}

void mousePressed() {
  for (int i = 0; i < BUTTONS.length; i++) {
    if (BUTTONS[i].MouseIsOver()) {
      currentScreen = BUTTONS[i].getLabel();  
    }
  }
}

void buttonSetup() {
  for (int i = 0; i < BUTTONS.length; i++) {
    BUTTONS[i] = new Button(LABELS[i], 300, 50);
  }
}

void buttonPlacement(float startX, float startY, float spacing, String mode) {
  for (Integer I : screens) {
    BUTTONS[I].Draw();
    if (mode.equals("horizontal")) {
      BUTTONS[I].setXY(startX + I * spacing, startY);
    } else if (mode.equals("vertical")) {
      BUTTONS[I].setXY(startX, startY + I * spacing);
    }
  }
}

void removeButtons() {
 for (int i = 0; i < BUTTONS.length; i++) {
    if (screens.contains(i)) {
      screens.remove(Integer.valueOf(i));
    }
  }
}