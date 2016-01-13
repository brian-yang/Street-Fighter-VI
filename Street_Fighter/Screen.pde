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
    
    void setupButtons(int index, float widthB, float heightB) {
      for (int j = 0; j < buttonLabels.get(index).size(); j++) {
        buttons.add(new ArrayList<Button>());
        buttons.get(index).add(new Button(buttonLabels.get(index).get(j), widthB, heightB));
      }
      isSetUp = true;
    }
    
    void placeButtons(int index, float x, float y, float space, String buttonMode) {
        for (int j = 0; j < buttons.get(index).size(); j++) {
          if (buttonMode.equals("horizontal")) {
            x += space;
          } else if (buttonMode.equals("vertical")) {
            y += space;
          }
          buttons.get(index).get(j).setXY(x, y);
          buttons.get(index).get(j).place();
        }
    }
    
}