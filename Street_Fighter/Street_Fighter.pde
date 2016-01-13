// =======================================================================================================================
HashMap<String, Screen> screens;
String curScreenName;
Screen activeScreen;
PImage bg;
FileParser parser;
// =======================================================================================================================

void setup() {
  size(1024, 768);
  smooth();

  parser = new FileParser(); // see FileParser class
  initializeScreens();
  curScreenName = "Menu";
  activeScreen = screens.get("Menu");
}

void draw() {
  showScreen(activeScreen);
}

void mouseReleased(){
  //debug
  //print(activeScreen);
  ArrayList<ArrayList<Button>> activeButtons = activeScreen.buttons;
  for (int i = 0; i < activeButtons.size(); i++) {
    for (int j = 0; j < activeButtons.get(i).size(); j++) {
      Button curButton = activeButtons.get(i).get(j);
      if (curButton.isHovering()) {
        setActiveScreen(curButton.getLabel());
        print(curButton.x);
        print(curButton.y);
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
  //Debug
  //print(curScreenName);
  //print(activeScreen);
  if (curScreenName.equals("Quit")) {
    exit();
  } else {
    if (!activeScreen.isSetUp) {
      for (int i = 0; i < activeScreen.buttonLabels.size(); i++) {
        activeScreen.setupButtons(i, 300, 50);
      }     }
    bg = loadImage(activeScreen.background);
    background(bg);
  }
  // Show screens
  if (curScreenName.equals("Menu")) {
    activeScreen.placeButtons(0, 100, 150, 80, "vertical");
  }
  //if (curScreenName.equals("Versus")) {
    //activeScreen.placeButtons(0, 300, 650, 50, "horizontal");
  //}
  if (curScreenName.equals("Training")) {
    activeScreen.placeButtons(0, -200, 700, 450, "horizontal");
    activeScreen.placeButtons(1, 0, 100, 250, "horizontal");
  }
}

// Initialize each screen
void initializeScreens() {
  screens = new HashMap<String, Screen>();
  screens.put("Menu", createScreen("menu.txt", "Background.png"));
  //screens.put("Versus", createScreen("vs.txt", "Background.png"));
  screens.put("Training", createScreen("training.txt", "Background.png"));
  //screens.put("Challenge", createScreen("challenge.txt", "Background.png"));
  //screens.put("Data", createScreen("data.txt", "Background.png"));
  //screens.put("Options", createScreen("options.txt", "Background.png"));
}

Screen createScreen(String file, String screenBG) {
  ArrayList<ArrayList<String>> labels = new ArrayList<ArrayList<String>>();
  parser.readLabels(file, labels);
  ArrayList<ArrayList<Button>> buttons = new ArrayList<ArrayList<Button>>(labels.size());
  Screen s = new Screen(buttons, labels, screenBG);
  return s;
}