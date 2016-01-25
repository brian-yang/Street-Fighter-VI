class Timer {
    PFont font;
    String time;
    int t;
    int interval;

    Timer(int countdown) {
        interval = countdown;
        textSize(100);
        font = createFont("Waree", 32);
        textFont(font);
        fill(0);
    }

    void run() {
        t = interval - int(millis() / 1000);
        if (t > 0) {
            time = nf(t, 3);
            text(time.substring(1), width / 2, 100);
        } else {
            text("GAME OVER", width / 2, height / 2);
        }
    }
}