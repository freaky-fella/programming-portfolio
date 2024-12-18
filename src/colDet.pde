//Yicheng Deng | colDet | 9 Sept 2024
int xspeed, yspeed;
int xpos, ypos, wdth, ht,xpos2,ypos2,x2speed,y2speed;

void setup() {
  size(1920, 1080);
  background(0);
  xspeed = 3;
  yspeed = 10;
  x2speed = 3;
  y2speed = 10;
  wdth = 10;
  ht = 10;
  noStroke();
  xpos = width/2;
  ypos = height/2;
  xpos2 = width/2;
  ypos2 = height/2;
  frameRate(1000000000);
}

void draw() {
  //background(255);
  fill(255);
  ellipse(xpos, ypos, 2*wdth, 2*ht);
//  xpos+=xspeed/2;
  ypos+=yspeed/2;
  if (xpos >= width-wdth/2 || xpos <= wdth/2) {
    xspeed *= -1;
  }
  if (ypos >= height-ht/2 || ypos <= ht/2) {
    yspeed = yspeed * -1;
  }
  fill(225,225,0);
  ellipse(xpos2, ypos2, 2*wdth, 2*ht);
  xpos2+=x2speed/2;
  ypos2+=y2speed/2;
  if (xpos2 >= width-wdth/2 || xpos2 <= wdth/2) {
    x2speed *= -1;
  }
  if (ypos >= height-ht/2 || ypos2 <= ht/2) {
    y2speed *=-1;
  }
}
