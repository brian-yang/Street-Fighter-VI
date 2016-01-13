class Screen {
    Button[][] buttons;
    String[][] buttonLabels;
    String background;
    // To implement

    
    Screen(Button[][] buttons, String[][] buttonLabels, String bg) {
        this.background = bg;
        this.buttonLabels = buttonLabels;
        this.buttons = buttons;
    }
    
    void setupMenuButtons(float widthB, float heightB) {
      for (int i = 0; i < buttons.length; i++) {
        for (int j = 0; j < buttons[i].length; j++) {
          buttons[i][j] = new Button(buttonLabels[i][j], widthB, heightB);
        }
      }
    }
    
    void placeMenuButtons(float x, float y, float space, String buttonMode) {
      for (int i = 0; i < buttons.length; i++) {
        for (int j = 0; j < buttons[i].length; j++) {
          if (buttonMode.equals("horizontal")) {
            x += space;
          } else if (buttonMode.equals("vertical")) {
            y += space;
          } else if (buttonMode.equals("grid")) {
            x += space;
            y += space;
          }
          buttons[i][j].setXY(x, y);
          buttons[i][j].place();
        }
      }
    }
    
}