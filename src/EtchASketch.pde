//Yicheng | Etch A Sketch | 18 Sept 2024
import java.util.ArrayList; // import the ArrayList class
int x, y;

void setup() {
  size(500, 500);
  background(127);
  x=width/2;
  y=height/2;
  //ArrayList<ArrayList<Integer>> lines = new ArrayList<ArrayList<Integer>>(); // Create an ArrayList object  strokeWeight(3);
  //stores xs and ys
}
void draw() {
  //background(127);
  //draw  new lines
  if (keyPressed) {
    if (key=='a'|| key == 'A') {
      x=x-1;
    }
  }
  if (keyPressed) {
    if (key=='d'|| key == 'D') {
      x=x+1;
    }
  }
  if (keyPressed) {
    if (key=='w'|| key == 'W') {
      y=y-1;
    }
  }
  if (keyPressed) {
    if (key=='s'|| key == 'S') {
      y=y+1;
    }
  }
  point(x, y);
}

void keyPressed() {

  if (key==CODED) {
    if (keyCode==UP) {

      y=y-1;
    } else if (keyCode==DOWN) {
      y=y+1;
    } else if (keyCode==LEFT) {
      x-=1;
    } else if (keyCode==RIGHT) {
      x+=1;
    }
  }
}

void mousePressed(){
  saveFrame("line-######.png");
}
