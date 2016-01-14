class Timer {
PFont font;
String time;
int t;
int interval = 5;

  Timer(){
      size(800,800);
      textSize(100);
      String[] fontList = PFont.list();
      printArray(fontList);
      font = createFont("Waree", 32);
      textFont(font);
      background(255);
      fill(0);
  }
  
   void run(){
      background(255);
      
      t = interval-int(millis()/1000);      
      if(t > 0){
        time = nf(t , 3);
        text(time, width/2, height/2);
      } else {    
        text("GAME OVER", width / 2, height / 2);
      }
    }
}