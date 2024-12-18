//Yicheng Deng| 9/3/2024 2A Programming
void setup() {
  size(900, 400);
  background(127);
}
void draw() {
  background(127);
  drawRef();
  histEvent(150, 200, "Z2", "The Z2 was one of the earliest examples of an electric operated digital computer built with electromechanical relays It was German 1940.  ",true);
  histEvent(225, 300, "Z3", "In 1941, Zuse followed his earlier machine up with the Z3,[67] the world's first working electromechanical programmable, fully automatic digital computer It was German 1941",false);
  histEvent(300, 200, "Lorenz SZ 40/42", "The Lorenz SZ 40/42 machine was used for high-level Army communications, code-named Tunny by the British 1941",true);
  histEvent(375, 300, "Colossus", "1943 Colossus was the world's first electronic digital programmable computer",false);
  histEvent(450, 200, "ENIAC", "US 1945 the first programmable, electronic, general-purpose digital computer",true);
  histEvent(525, 300, "UNIVAC", "US 1946 A versatile, general-purpose machine, UNIVAC was the brainchild of John Mauchly and Presper Eckert, creators of ENIAC.",false);
  histEvent(600, 200, "PDP-8", "US 1965 It was the first commercially successful minicomputer, with over 50,000 units being sold over the model's lifetime.",true);
  histEvent(675, 300, "Intel-4004", "Japan 1971 The Intel 4004 is a 4-bit central processing unit released by Intel Corporation in 1971. Sold for US$60, it was the first commercially produced microprocessor, and the first in a long line of Intel CPUs.",false);


}

void drawRef() {
  //timelineformat
  strokeWeight(3);
  stroke(0);
  line(100, 250, 800, 250);
  textSize(18);
  text("1940", 80, 270);
  text("1960", 810, 270);

  //Title text
  textSize(35);
  textAlign(CENTER);
  fill(50);
  text("Historic Computer Systems", width/2, 60);
  textSize(30);
  text("by Yicheng Deng", width/2, 85);
}

void histEvent(int x, int y, String val, String detail, boolean top) {
  if (top) {

    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  fill(200);
  rectMode(CENTER);
  rect(x, y, 80, 20);
  fill(0);
  textSize(12);
  text(val, x, y+5);
  if (mouseX>x-40 && mouseX<x+40 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
