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
      if (activeButtons.get(i).get(j).isHovering()) {
        setActiveScreen(activeButtons.get(i).get(j).getLabel());
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
      activeScreen.setupMenuButtons(300, 50);
    }
    bg = loadImage(activeScreen.background);
    background(bg);
  }
  // Show screens
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
  screens = new HashMap<String, Screen>();
  screens.put("Menu", createScreen("menu.txt", "Background.png"));
  //screens.put("Versus", createScreen("vs.txt", "Background.png"));
  //screens.put("Training", createScreen("training.txt", "Background.png"));
  //screens.put("Challenge", createScreen("challenge.txt", "Background.png"));
  //screens.put("Data", createScreen("data.txt", "Background.png"));
  //screens.put("Options", createScreen("options.txt", "Background.png"));
}

void readLabels(String file, ArrayList<ArrayList<String>> labels) {  
  String lines[] = loadStrings(file); // loads the string from another file
  int row = 0;
  for (int i = 0; i < lines.length; i++) {
    // start new row
    if (lines[i].startsWith("--")) {
      row++;
    }
    // creates new arrays within 2d array
    while (labels.size() - 1 != row) {
      labels.add(new ArrayList<String>());
    }
    // add elements
    println(lines[i]);
    labels.get(row).add(lines[i]);
  }
}

Screen createScreen(String file, String screenBG) {
  ArrayList<ArrayList<String>> labels = new ArrayList<ArrayList<String>>();
  readLabels(file, labels);
  ArrayList<ArrayList<Button>> buttons = new ArrayList<ArrayList<Button>>(labels.size());
  Screen s = new Screen(buttons, labels, screenBG);
  return s;
}