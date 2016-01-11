class Screen {
    Button[][] buttons;
    String[] buttonLabels;
    String background;
    // To implement

    
    Screen(Button[][] buttons, String[] buttonLabels, String bg) {
        this.background = bg;
        this.buttonLabels = buttonLabels;
        this.buttons = buttons;
    }
    
    void setupMenuButtons() {
      for (int i = 0; i < buttons.length; i++) {
        for (int j = 0; j < buttons[i].length; j++) {
          buttons[i][j] = new Button(buttonLabels[j], 300, 50);
        }
      }
    }
    
    void placeMenuButtons(float buttonStartX, float buttonStartY, float buttonSpacing, String buttonMode) {
      for (int i = 0; i < buttons.length; i++) {
        for (int j = 0; j < buttons[i].length; j++) {
          if (buttonMode.equals("horizontal")) {
            buttons[i][j].setXY(buttonStartX + j * buttonSpacing, buttonStartY);
          } else if (buttonMode.equals("vertical")) {
            buttons[i][j].setXY(buttonStartX, buttonStartY + j * buttonSpacing);
          }
          buttons[i][j].Draw();
        }
      }
    }
    
}