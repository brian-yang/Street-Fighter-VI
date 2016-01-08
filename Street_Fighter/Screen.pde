class Screen {
    Button[][] buttons;
    String[] buttonLabels;
    String background;
    // To implement

    
    Screen(Button[][] buttons, String[] buttonLabels, String bg) {
        this.background = bg;
        this.buttonLabels = buttonLabels;
        this.buttons = buttons;
        setupMenuButtons();
    }
    
    void setupMenuButtons() {
      for (int i = 0; i < buttons.length; i++) {
        for (int j = 0; j < buttons.length; j++) {
          buttons[i][j] = new Button(buttonLabels[i], 300, 50);
        }
      }
    }
    
    void placeMenuButtons(float buttonStartX, float buttonStartY, float buttonSpacing, String buttonMode) {
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
