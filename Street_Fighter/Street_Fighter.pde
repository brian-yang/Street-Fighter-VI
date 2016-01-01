Button menu, vs, training, challenge, customize, data, options, store, quit;
Button[] buttons;
String[] labels;

void setup() {
  size (1400, 800);
  smooth();
  
  labels = new String[] {"Menu", "Versus", "Training", "Challenge", "Customize", "Data", "Option", "Store", "Quit"};
  buttons = new Button[] {menu, vs, training, challenge, customize, data, options, store, quit};
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(labels[i], 100, 50 + i * 75, 100, 50);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].Draw();
  }
}

void mousePressed()
{}