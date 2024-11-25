//Yicheng Deng | 6 Nov 2024 | SpaceGame
import processing.sound.*;
SoundFile laser1;


int score, level, health, rockTime;


boolean play;

Spaceship s1;
Rock r1;


ArrayList<Rock> rocks= new ArrayList<Rock>();
ArrayList<Laser> lasers= new ArrayList<Laser>();
ArrayList<Powerup> powerups= new ArrayList<Powerup>();
ArrayList<Star> stars= new ArrayList<Star>();



Timer rTime, puTime;
void setup() {
  size(1000, 1000);
  rockTime=1000;
  laser1=new SoundFile(this, "laser.wav");
  s1 = new Spaceship();
  rTime = new Timer(rockTime);
  rTime.start();
  puTime = new Timer(3000);
  puTime.start();
  noCursor();
  level=1;
  play = false;
}

void draw() {
  if (play==false) {
    startScreen();
  } else {
    if (frameCount%1000==0) {
      level+=1;
      rockTime-=50;
    }



    noCursor();
    background(0);
    stars.add(new Star());
    for (int i = 0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }
    s1.display();
    //if(keyPressed && key==' '){
    //  lasers.add(new Laser(s1.x, s1.y));
    //}
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j<rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          lasers.remove(laser);
          score+=r.diam;
          r.diam-=10;
          if (r.diam<5) {
            rocks.remove(r);
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    s1.move(mouseX, mouseY);
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        s1.health-=rock.diam;
        rocks.remove(rock);
        score+=rock.diam;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    if (puTime.isFinished()) {
      powerups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powerups.size(); i++) {
      Powerup pu = powerups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        if (pu.type=='h') {
          s1.health+=100;
          //powerups.remove(pu);
        } else if (pu.type=='a') {
          s1.laserCount+=100;
          //powerups.remove(pu);
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      }
    }
    infoPanel();
    if (s1.health<1) {
      gameOver();
      noLoop();
    }
  }
}
void keyPressed() {
  if (key==' '&& s1.fire()) {
    laser1.play();

    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount -=1;
  }
}
void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(35);
  text("Score: "+ score, 20, 35);
  text("Health: " + s1.health, 300, 35);
  text("Ammo: " + s1.laserCount, 500, 35);
  text("Level: " + level, 700, 35);
}

void startScreen() {
  background(0);
  fill(255);
  textSize(90);
  text("Welcome to SpaceGame", width/16, 300);
  text("  Click to Start", width/4, 600);
  if (mousePressed) {
    play=true;
  }
}

void ticker() {
}

void gameOver() {
  background(0);
  fill(255);
  textSize(90);
  text(" Game Over", width/3.5, 300);
  text("Final Score: " + score, width/5, 600);
  text("Final Level: " + level, width/3.5, 900);
}

void mousePressed() {
  if (s1.fire()) {
    laser1.play();
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  }
}
