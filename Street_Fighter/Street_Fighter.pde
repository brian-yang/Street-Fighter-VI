Button menu, vs, training, challenge, customize, data, options, store;

void setup() {
  size (1400, 800);
  smooth();
  
  menu = new Button("Menu", 100, 50, 100, 50);
  vs = new Button("Versus", 100, 125, 100, 50);
  training = new Button("Training", 100, 200, 100, 50);
  challenge = new Button("Challenge", 100, 275, 100, 50);
  customize = new Button("Customize", 100, 350, 100, 50);
  data = new Button("Data", 100, 425, 100, 50);
  options = new Button("Option", 100, 500, 100, 50);
  store = new Button("Store", 100, 575, 100, 50);
  
}

void draw() {
  background (0);    
  menu.Draw();
  vs.Draw();
  training.Draw();
  challenge.Draw();
  customize.Draw();
  data.Draw();
  options.Draw();
  store.Draw();
}

void mousePressed()
{}

class Button {
  String label;
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    fill(218);
    stroke(255,0,0);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
}