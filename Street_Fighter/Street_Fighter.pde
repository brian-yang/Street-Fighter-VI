// =======================================================================================================================
Screen menu, vs, training, challenge, data, options, quit;
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
}

void draw() {
  showScreen(activeScreen);
}

void mouseReleased(){
  //debug
  //print(activeScreen);
  Button[][] test = activeScreen.buttons;
  for (int i = 0; i < test.length; i++) {
    for (int j = 0; j < test[i].length; j++) {
      if (test[i][j].isHovering()) {
        setActiveScreen(test[i][j].getLabel());
      }
    }
  }
}

/**
 * We switch between screens with this function.
 */
void setActiveScreen(String name) {
  activeScreen = screens.get(name);
  curScreenName = name;
}

void showScreen(Screen activeScreen) {
  if (curScreenName.equals("Quit")) {
    exit();
  }
  // Show screens
  //print(curScreenName);
  //print(activeScreen);
  bg = loadImage(activeScreen.background);
  background(bg);
  if (curScreenName.equals("Menu")) {
    activeScreen.placeMenuButtons(100, 150, 80, "vertical");
  }
  if (curScreenName.equals("Versus")) {
    activeScreen.placeMenuButtons(300, 650, 50, "horizontal");
  }
  if (curScreenName.equals("Training")) {
    activeScreen.placeMenuButtons(300, 650, 50, "horizontal");
  }
}

// Initialize each screen
void initializeScreens() {
  // Menu
  String[] labelsM = new String[] {"Versus", "Training", "Challenge", "Data", "Options", "Quit"};
  Button[][] buttonsM = new Button[1][6];
  menu = new Screen(buttonsM, labelsM, "Background.png");
  menu.setupMenuButtons();
  // Versus
  String[] labelsVS = new String[] {"Back", "Quit"};
  Button[][] buttonsVS = new Button[1][2];
  vs = new Screen(buttonsVS, labelsVS, "Background.png");
  vs.setupMenuButtons();
  // Training
  String[] labelsT = new String[] {"Back", "Quit"};
  Button[][] buttonsT = new Button[1][2];
  training = new Screen(buttonsT, labelsT, "Background.png");
  training.setupMenuButtons();
  
  screens = new HashMap<String, Screen>();
  screens.put("Menu", menu);
  screens.put("Versus", vs);
  screens.put("Training", training);
  screens.put("Challenge", challenge);
  screens.put("Data", data);
  screens.put("Options", options);
}