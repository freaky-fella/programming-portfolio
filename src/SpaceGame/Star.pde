class Star {
  int x, y, diam, speed;

  Star() {
    x=int(random(width));
    y=-10;
    speed = int(random(1, 6));
    diam = int(random(1, 5));
  }
  void display() {
    fill(255);
    ellipse(x, y, diam, diam);
  }

  void move() {
    y+=speed;
  }


  boolean reachedBottom() {
    if (y>height+10) {
      return true;
    } else {
      return false;
    }
  }
}
