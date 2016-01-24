class FileParser {
    // gets button labels from text files -- determines which labels to group together
    // based on how the text file is formatted (i.e. if // is encountered, the entire line
    // is a comment and not stored in labels)
    void readLabels(String file, ArrayList < ArrayList < String >> labels) {
        String[] lines = loadStrings(file); // loads the string from another file
        int row = 0;
        for (int i = 0; i < lines.length; i++) {
            // start new row
            if (lines[i].startsWith("--")) {
                row++;
            }
            // creates new arrays within 2d array
            while (labels.size() - 1 != row) {
                labels.add(new ArrayList < String > ());
            }
            // add elements - does not add lines starting with //
            if (!lines[i].startsWith("//") && !lines[i].startsWith("--")) {
                labels.get(row).add(lines[i]);
            }
        }
    }
    
    // gets blocks of text from text files
    void readTextBlocks(String file, ArrayList < String > blocks) {
        String block = "";
        String[] lines = loadStrings(file); // loads the string from another file
        for (int i = 0; i < lines.length; i++) {
          // add elements - does not add lines starting with //
          if (!lines[i].startsWith("//") && !lines[i].startsWith("--")) {
              block += lines[i] + '\n';
          }
          // start new row
          if (i + 1 == lines.length || lines[i].startsWith("--")) {
              blocks.add(block.trim());
              block = "";
          }
        }
    }
    
    // checks if a line of text is within a file
    boolean isInFile(String file, String txt) {
        String lines[] = loadStrings(file);
        for (int i = 0; i < lines.length; i++) {
            if (lines[i].equals(txt)) {
                return true;
            }
        }
        return false;
    }
}