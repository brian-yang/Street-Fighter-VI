class Screen {
    Button[][] buttons;
    PImage background;
    // To implement
    float buttonStartX;
    float buttonStartY;
    float buttonSpacing;
    String buttonMode;
    
    Screen(Button[][] buttons, PImage bg) {
        this.background = bg;
        this.buttons = buttons;
        setupMenuButtons();
    }
    
    void setupMenuButtons() {
      for (int i = 0; i < buttons.length; i++) {
        for (int j = 0; j < buttons.length; j++) {
          buttons[i][j] = new Button(LABELS[i], 300, 50);
        }
      }
    }
    
    void placeMenuButtons() {
      for (int i = 0; i < buttons.length; i++) {
        for (int j = 0; j < buttons.length; j++) {
          buttons[i][j].Draw();
          if (buttonMode.equals("horizontal")) {
            buttons[i][j].setXY(buttonStartX + i * buttonSpacing, buttonStartY);
          } else if (buttonMode.equals("vertical")) {
            buttons[i][j].setXY(buttonStartX, buttonStartY + i * buttonSpacing);
          }
        }
      }
    }
    
}