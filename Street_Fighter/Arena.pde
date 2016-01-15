class Arena extends Screen {
  
  Arena(String bg) {
    super(bg);
  }
  
  void run() {
    Timer timer = new Timer(99);
    timer.run();
  }
}