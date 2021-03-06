// =======================================================================================================================
HashMap<String, Screen> screens;
String curScreenName;
Screen activeScreen;
PImage bg;
FileParser parser;
PFont defaultFont;
// checks if a key has been pressed when the fight has started
int numPlayers;
boolean[] downKeys = new boolean[260];
boolean[] downKeys2 = new boolean[260];
String fighter1 = "";
String fighter2 = "";
boolean playerTurn = true; // determines whose turn it is to select a character
// list of controls for each player -- do not change unless you change it in the Arena class too
char[] controls = new char[] {'w','a','s','d',
                              'g','h','e','q',
                              'r','f','x','c'}; // player 1
char[] controls2 = new char[] {',','.','/','m',
                               'j','k','l','n'};  // player 2 -- does not include the arrow keys
// =======================================================================================================================
void setup() {
    size(1024, 768);
    smooth();

    defaultFont = loadFont("Ubuntu-48.vlw");
    parser = new FileParser(); // see FileParser class
    initializeScreens();
    curScreenName = "Menu";
    activeScreen = screens.get("Menu");
}

void draw() {
    showScreen(activeScreen);
}

void mouseReleased() {
    //debug
    //print(activeScreen);
    if (!curScreenName.equals("Arena")) {
        checkScreenButtons(activeScreen.buttons);
    }
}
// =======================================================================
// ==============================BUTTONS==================================

// checks if the mouse is hovering over a button
void checkScreenButtons(ArrayList < ArrayList < Button >> buttons) {
    for (int i = 0; i < buttons.size(); i++) {
        for (int j = 0; j < buttons.get(i).size(); j++) {
            Button curButton = buttons.get(i).get(j);
            if (curButton.isHovering()) {
                activateButton(curButton);
            }
        }
    }
}

// activates a button (if user is in the character select menu
// and the button is a fighter, then set up the arena)
void activateButton(Button b) {
    if (b.getLabel().equals("Quit")) {
        exit();
    } else if (parser.isInFile("data/customization/characters.txt", b.getLabel())) {
        if (playerTurn) {
          fighter1 = b.getLabel();
          playerTurn = false;
        } else {
          fighter2 = b.getLabel();
          playerTurn = true;
        }
    } else if (!fighter1.isEmpty() && !fighter2.isEmpty() && b.getLabel().equals("Fight!")) {
        resetKeys();
        setActiveScreen("Arena");
    } else if (b.getLabel().equals("Back")) {
        setActiveScreen("Menu");
        fighter1 = "";
        fighter2 = "";
    } else if (!b.getLabel().equals("Fight!")) {
        setActiveScreen(b.getLabel());
    }
}
// =======================================================================
// ============================KEY PRESSES================================
void keyPressed() {
    if (curScreenName == "Arena") {
        if (key < 256) {
            downKeys[key] = true;
            downKeys2[key] = true;
        }
        if (keyCode == RIGHT) {
            downKeys2[256] = true;
        }
        if (keyCode == LEFT) {
            downKeys2[257] = true;
        }
        if (keyCode == DOWN) {
            downKeys2[258] = true;
        }
        if (keyCode == UP) {
            downKeys2[259] = true;
        }
        if (keyCode == SHIFT) {
            downKeys2[260] = true;
        }
        interrupt(downKeys, 1);
        interrupt(downKeys2, 2);
    }
}

void keyReleased() {
    if (curScreenName == "Arena") {
        if (key < 256) {
            downKeys[key] = false;
            downKeys2[key] = false;
        }
        if (keyCode == RIGHT) {
            downKeys2[256] = false;
        }
        if (keyCode == LEFT) {
            downKeys2[257] = false;
        }
        if (keyCode == DOWN) {
            downKeys2[258] = false;
        }
        if (keyCode == UP) {
            downKeys2[259] = false;
        }
        if (keyCode == SHIFT) {
            downKeys2[260] = false;
        }
    }
}

// interrupts a command if another key has been pressed
// i.e. interrups while walking
void interrupt(boolean[] commands, int playerNum) {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      setCommands(256, commands, playerNum);
    } else if (keyCode == LEFT) {
      setCommands(257, commands, playerNum);
    }
  } else if (key < 256) {
    if (key != 's' || key != 'w') {
      setCommands(key, commands, playerNum);
    }
  }
}

// makes sure no attack commands are being run simultaneously
void setCommands(int index, boolean[] commands, int playerNum) {
  for (int i = 0; i < commands.length; i++) {
    if (playerNum == 1) {
      if (validKey(index, controls) && i != index) {
        if (i == 's' && commands['s'] && !commands['w']) {
          commands[i] = true;
        } else if (i == 'w' && commands['w'] && !commands['s']) {
          commands[i] = true;
        } else {
          commands[i] = false;
        }
      }
    } else if (playerNum == 2) {
      if (validKey(index, controls2) && i != index) {
        if (i == 258 && commands[258] && !commands[259]) {
          commands[i] = true;
        } else if (i == 259 && commands[259] && !commands[258]) {
          commands[i] = true;
        } else {
          commands[i] = false;
        }
      }
    }
  }
}

// checks if a key that has been pressed is a valid key for the player
// i.e. if the arrow keys are pressed, then it should only affect player 2
boolean validKey(int index, char[] characters) {
  for (int i = 0; i < characters.length; i++) {
    if (index == characters[i]) {
      return true;
    }
  }
  return false;
}

// resets keys when a new fight has begun
void resetKeys() {
        for (int i = 0; i < downKeys.length; i++) {
            downKeys[i] = false;
        }
        for (int i = 0; i < downKeys2.length; i++) {
            downKeys2[i] = false;
        }
    }
// =================================================================
// ============================SCREENS==============================

// sets the current screen to a new screen
void setActiveScreen(String name) {
    activeScreen = screens.get(name);
    curScreenName = name;
    if (name.equals("Arena")) {
        ((Arena) activeScreen).initialize(fighter1, downKeys, fighter2, downKeys2);
        if (round(random(1)) == 0){
          ((Arena) activeScreen).background = "data/images/arena.jpg";
        } else {
          ((Arena) activeScreen).background = "data/images/arena2.jpeg";
         }
    }
}

// displays the current screen
void showScreen(Screen activeScreen) {
    if (!activeScreen.isSetUp) {
        for (int i = 0; i < activeScreen.buttonLabels.size(); i++) {
            activeScreen.setupButtons(i, 300, 50);
        }
    }
    // Show background and place buttons
    bg = loadImage(activeScreen.background);
    background(bg);
    textFont(defaultFont);
    textSize(20);
    if (curScreenName.equals("Menu")) {
        activeScreen.placeButtons(0, 100, 200, 100, "vertical");
    } else if (curScreenName.equals("Versus") || curScreenName.equals("Training")) {
        if (curScreenName.equals("Versus")) {
          numPlayers = 2;
        } else {
          numPlayers = 1;
        }
        activeScreen.placeButtons(0, -415, 700, 510, "horizontal");
        activeScreen.placeButtons(1, width / 2 - 165, 100, 75, "vertical");
        activeScreen.placeButtons(2, width / 2 - 165, 500, 100, "vertical");
        textSize(18);
        if (!fighter1.isEmpty()) {
          textSize(80);
          fill(255, 0, 0);
          text(fighter1, width / 2 - 330, height / 2);
        }
        if (!fighter2.isEmpty()) {
          textSize(80);
          fill(0, 0, 255);
          text(fighter2, width / 2 + 300, height / 2);
        }
        if (!fighter1.isEmpty() && !fighter2.isEmpty()){
          textSize(70);
          fill(255);
          text("VERSUS", width / 2 - 20, height / 2 + 130);
        }
    } else if (curScreenName.equals("Instructions")) {
        activeScreen.placeButtons(0, -415, 700, 510, "horizontal");
        fill(218);
        stroke(255,0,0);
        rect(65, 150, 900, 500, 10);
        line(510, 150, 510, 650);
        textAlign(CENTER, CENTER);
        ArrayList<String> instructions = new ArrayList<String>();
        parser.readTextBlocks("data/customization/instructions.txt", instructions);
        for (int i = 0; i < instructions.size(); i++) {
          textSize(16);
          fill(0);
          text(instructions.get(i), 260 + i * 490, 375);
        }
    } else if (curScreenName.equals("Arena")) {
        ((Arena) activeScreen).run(numPlayers);
        // goes back to the menu if the match is over and 5 seconds have passed
        if (((Arena) activeScreen).timer.time > 3 && !((Arena) activeScreen).winner.isEmpty()) {
          setActiveScreen("Menu");
        }
    } 
}

// store each screen in a hashmap of screens
void initializeScreens() {
    screens = new HashMap < String, Screen > ();
    screens.put("Menu", createScreen("data/customization/menu.txt", "data/images/Background.png"));
    screens.put("Versus", createScreen("data/customization/character-select.txt", "data/images/character-select.jpg"));
    screens.put("Training", createScreen("data/customization/character-select.txt", "data/images/character-select.jpg"));
    screens.put("Instructions", createScreen("data/customization/instructions-buttons.txt", "data/images/Background.png"));
    screens.put("Arena", createArena("data/images/arena.jpg"));
}

// instantiates screens
// ====================
// screens with buttons
Screen createScreen(String file, String screenBG) {
    ArrayList < ArrayList < String >> labels = new ArrayList < ArrayList < String >> ();
    parser.readLabels(file, labels);
    ArrayList < ArrayList < Button >> buttons = new ArrayList < ArrayList < Button >> (labels.size());
    Screen s = new Screen(buttons, labels, screenBG);
    return s; //<>//
}
// arena
Arena createArena(String screenBG) {
    Arena arena = new Arena(screenBG);
    return arena; //<>//
}