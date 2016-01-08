// =======================================================================================================================
Screen menu, vs, training, challenge, data, options, quit;
Screen[] screenList = {menu, vs, training, challenge, data, options, quit};
String[] LABELS = new String[] {"Menu", "Versus", "Training", "Challenge", "Data", "Options", "Quit"};
// =======================================================================================================================
HashMap<String, Screen> screens;
String curScreenName;
Screen activeScreen;
Button[][] buttons;
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
  for (int i = 0; i < buttons.length; i++) {
    for (int j = 0; j < buttons[i].length; j++) {
      if (buttons[i][j].isHovering()) {
        setActiveScreen(buttons[i][j].getLabel());
        curScreenName = buttons[i][j].getLabel();
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
  background(activeScreen.background);
  activeScreen.placeMenuButtons();
  // do if else here
}

void initializeScreens() {
  screens = new HashMap<String, Screen>();
  for (int i = 0; i < screenList.length; i++) {
    screens.put(LABELS[i], screenList[i]);
  }
  // initialize screens here
}