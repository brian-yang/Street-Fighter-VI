class FileParser {
  void readLabels(String file, ArrayList<ArrayList<String>> labels) {  
    String lines[] = loadStrings(file); // loads the string from another file
    int row = 0;
    for (int i = 0; i < lines.length; i++) {
      // start new row
      if (lines[i].startsWith("--")) {
        row++;
      }
      // creates new arrays within 2d array
      while (labels.size() - 1 != row) {
        labels.add(new ArrayList<String>());
      }
      // add elements - does not add lines starting with //
      if (!lines[i].startsWith("//")) {
        labels.get(row).add(lines[i]);
      }
    }
  }
}