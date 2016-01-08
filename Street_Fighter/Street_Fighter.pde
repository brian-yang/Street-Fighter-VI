// =======================================================================================================================
Screen menu, vs, training, challenge, data, options, quit;
Screen[] screenList = {menu, vs, training, challenge, data, options, quit};
// =======================================================================================================================
HashMap<String, Screen> screens;
String curScreenName;
Screen activeScreen;
PImage bg;
// =======================================================================================================================

void setup() {
  size(1024, 768);
  smooth();

  initializeScreens();
  curScreenName = "Menu";
  activeScreen = menu;
  showScreen(activeScreen);
}

void draw() {
  /*
  if (curScreenName == "Menu") {
    setActiveScreen("Menu");    
    /*
    background(bg);
    for (int i = 1; i < screens.size(); i++) {
      screens.put(LABELS[i], Integer.valueOf(i));
    }
    placeButtons(100, 125, 65, "vertical");
  } else if (curScreenName == "Versus") {
    /*
    background(0);
    screens.add(Integer.valueOf(0));
    screens.add(Integer.valueOf(screens.size() - 1));
    placeButtons(300, 650, 50, "horizontal");
  */
  if (curScreenName == "Quit") {
    exit();
  }
  showScreen(activeScreen);
}

void mousePressed() {
  for (int i = 0; i < activeScreen.buttons.length; i++) {
    for (int j = 0; j < activeScreen.buttons[i].length; j++) {
      if (activeScreen.buttons[i][j].isHovering()) {
        setActiveScreen(activeScreen.buttons[i][j].getLabel());
        curScreenName = activeScreen.buttons[i][j].getLabel();
      }
    }
  }
}

/**
 * We switch between screens with this function.
 */
void setActiveScreen(String name) {
  activeScreen = screens.get(name);
}

void showScreen(Screen activeScreen) {
  PImage bg = loadImage(activeScreen.background);
  background(bg);
  // do if else here
  if (curScreenName == "Menu") {
    activeScreen.placeMenuButtons(100, 125, 65, "vertical");
  }
}

// Initialize each screen
void initializeScreens() {
  // Menu
  String[] labelsM = new String[] {"Menu", "Versus", "Training", "Challenge", "Data", "Options", "Quit"};
  screens = new HashMap<String, Screen>();
  for (int i = 0; i < screenList.length; i++) {
    screens.put(labelsM[i], screenList[i]);
  }
  Button[][] buttonsM = new Button[1][7];
  menu = new Screen(buttonsM, labelsM, "Background.png");
}


