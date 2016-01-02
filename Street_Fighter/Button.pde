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
  
  Button(String labelB, float widthB, float heightB) {
    this(labelB, 0, 0, widthB, heightB);
  }
  
  void Draw() {
    fill(218);
    stroke(255,0,0);
    rect(x, y, w, h, 10); // last argument causes the rounded corners
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean isHovering() {
    return mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h);
  }
  
  String getLabel() {
    return label;
  }
  
  void setX(float xpos) {
    x = xpos;
  }
  
  void setY(float ypos) {
    y = ypos;
  }

  void setXY(float xpos, float ypos) {
    setX(xpos);
    setY(ypos);
  }

}