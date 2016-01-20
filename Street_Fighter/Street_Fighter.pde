// =======================================================================================================================
HashMap<String, Screen> screens;
String curScreenName;
Screen activeScreen;
PImage bg;
FileParser parser;
boolean[] downKeys = new boolean[261];
boolean[] downKeys2 = new boolean[261];
// list of controls for each player -- do not change unless you change it in the Arena class too
char[] controls = new char[] {'w','a','s','d',
                           'g','h','e','q',
                           'r','f','x','c'}; // player 1
char[] controls2 = new char[] {',','.','/','m'};  // player 2 -- does not include the arrow keys
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

void mouseReleased() {
    //debug
    //print(activeScreen);
    if (!curScreenName.equals("Arena")) {
        ArrayList < ArrayList < Button >> activeButtons = activeScreen.buttons;
        for (int i = 0; i < activeButtons.size(); i++) {
            for (int j = 0; j < activeButtons.get(i).size(); j++) {
                Button curButton = activeButtons.get(i).get(j);
                if (curButton.isHovering()) {
                    if (parser.isInFile("characters.txt", curButton.getLabel())) {
                        setActiveScreen("Arena");
                        resetKeys();
                    } else {
                        setActiveScreen(curButton.getLabel());
                    }
                }
            }
        }
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

void interrupt(boolean[] commands, int playerNum) {
    if (key == CODED) {
        if (keyCode == RIGHT) {
            setCommands(256, commands, playerNum);
        } else if (keyCode == LEFT) {
            setCommands(257, commands, playerNum);
        } else if (keyCode == DOWN) {
            setCommands(258, commands, playerNum);
        } else if (keyCode == UP) {
            setCommands(259, commands, playerNum);
        } else if (keyCode == SHIFT) {
            setCommands(260, commands, playerNum);
        }
    } else if (key < 256) {
        setCommands(key, commands, playerNum);
    }
}

void setCommands(int index, boolean[] commands, int playerNum) {
    for (int i = 0; i < commands.length; i++) {
        if (playerNum == 1) {
            if (validKey(index, controls) && i != index) {
                commands[i] = false;
            }
        } else if (playerNum == 2) {
            if (validKey(index, controls2) && i != index) {
                commands[i] = false;
            }
        }
    }
}

boolean validKey(int index, char[] characters) {
    for (int i = 0; i < characters.length; i++) {
        if (index == characters[i]) {
            return true;
        }
    }
    return false;
}

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
void setActiveScreen(String name) {
    activeScreen = screens.get(name);
    curScreenName = name;
    if (name.equals("Arena")) {
        ((Arena) activeScreen).initialize("Cammy", "Cammy");
    }
}

void showScreen(Screen activeScreen) {
    //Debug
    //print(curScreenName);
    //print(activeScreen);
    if (curScreenName.equals("Quit")) {
        exit();
    } else {
        if (!activeScreen.isSetUp) {
            if (curScreenName.equals("Arena")) {
                ((Arena) activeScreen).initialize("Cammy", "Cammy");
            } else {
                for (int i = 0; i < activeScreen.buttonLabels.size(); i++) {
                    activeScreen.setupButtons(i, 300, 50);
                }
            }
        }
        bg = loadImage(activeScreen.background);
        background(bg);
    }
    // Show screens
    if (curScreenName.equals("Menu")) {
        activeScreen.placeButtons(0, 100, 150, 80, "vertical");
    }
    if (curScreenName.equals("Training")) {
        activeScreen.placeButtons(0, -200, 700, 450, "horizontal");
        activeScreen.placeButtons(1, 0, 100, 250, "horizontal");
    }
    if (curScreenName.equals("Arena")) {
        ((Arena) activeScreen).run(downKeys, downKeys2);
    }
}

// Initialize each screen
void initializeScreens() {
    screens = new HashMap < String, Screen > ();
    screens.put("Menu", createScreen("menu.txt", "Background.png"));
    //screens.put("Versus", createScreen("vs.txt", "Background.png"));
    screens.put("Training", createScreen("training.txt", "Background.png"));
    //screens.put("Challenge", createScreen("challenge.txt", "Background.png"));
    //screens.put("Data", createScreen("data.txt", "Background.png"));
    //screens.put("Options", createScreen("options.txt", "Background.png"));
    screens.put("Arena", createArena("Background.png"));
}

Screen createScreen(String file, String screenBG) {
    ArrayList < ArrayList < String >> labels = new ArrayList < ArrayList < String >> ();
    parser.readLabels(file, labels);
    ArrayList < ArrayList < Button >> buttons = new ArrayList < ArrayList < Button >> (labels.size());
    Screen s = new Screen(buttons, labels, screenBG);
    return s;
}

Arena createArena(String screenBG) {
    Arena arena = new Arena(screenBG);
    return arena;
} //<>//