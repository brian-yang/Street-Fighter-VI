class Screen {
    ArrayList<ArrayList<Button>> buttons; // buttons
    ArrayList<ArrayList<String>> buttonLabels; // button labels
    String background; // name of background piture
    boolean isSetUp; // checks if buttons have been initialized

    
    Screen(ArrayList<ArrayList<Button>> buttons, ArrayList<ArrayList<String>> buttonLabels, String bg) {
        this.background = bg;
        this.buttonLabels = buttonLabels;
        this.buttons = buttons;
        isSetUp = false;
    }
    
    void setupMenuButtons(float widthB, float heightB) {
      for (int i = 0; i < buttonLabels.size(); i++) {
        for (int j = 0; j < buttonLabels.get(i).size(); j++) {
          buttons.add(new ArrayList<Button>());
          buttons.get(i).add(new Button(buttonLabels.get(i).get(j), widthB, heightB));
        }
      }
      isSetUp = true;
    }
    
    void placeMenuButtons(float x, float y, float space, String buttonMode) {
      for (int i = 0; i < buttons.size(); i++) {
        for (int j = 0; j < buttons.get(i).size(); j++) {
          if (buttonMode.equals("horizontal")) {
            x += space;
          } else if (buttonMode.equals("vertical")) {
            y += space;
          } else if (buttonMode.equals("grid")) {
            x += space;
            y += space;
          }
          buttons.get(i).get(j).setXY(x, y);
          buttons.get(i).get(j).place();
        }
      }
    }
    
}