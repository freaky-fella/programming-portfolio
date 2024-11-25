class Spaceship {
  int x, y, w, health, laserCount, turretCount;

  Spaceship() {
    x=width/2;
    y=height/2;
    w=100;
    health=100;
    laserCount=100;
  }
  void display() {
    fill(80);
    rect(x+5, y+20, 15, 30);
    rect(x-20, y+20, 15, 30);
    fill(255);
    fill(127);
    triangle(x, y-40, x+35, y+40, x-35, y+40);
    fill(80);
    triangle(x, y-35, x+8, y-20, x-8, y-20);
    ellipse(x, y+20, 20, 60);
    stroke(220);
    //line(x+20,y-20,x+20,y+20);
  }







  void move(int tempX, int tempY) {
    x=tempX;
    y=tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(r.x, r.y, x, y);
    if (d<r.diam/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedTop() {
    return false;
  }
}
