class Powerup {
  int x, y, diam, speed;
  //PImage r1;
  char type;
  PImage r1, r2;
  Powerup() {
    x=int(random(width));
    y=0;
    speed = int(random(1, 5));
    diam = int(random(20, 75));
    r1=loadImage("bullet2.png");
    r2=loadImage("mini2.png");
    //r1 = loadImage("Rock1.png");
    int rand = int(random(2));
    if (rand==0) {
      type='h';
    } else if (rand ==1) {
      type='a';
    }
  }
  void display() {
    if (type=='h') {
      r2.resize(diam+50, diam+50);
      image(r2, x, y);
    } else if (type=='a') {
      image(r1, x, y);
      r1.resize(diam+50, diam+50);
    }
    //fill(127);
    //r1.resize(diam,diam);
    //image(r1, x, y);
  }

  void move() {
    y=y+speed;
  }


  boolean intersect(Spaceship s) {
    float d=dist(x, y, s.x, s.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y>height+200) {
      return true;
    } else {
      return false;
    }
  }
}
