//Yicheng Deng |Calculator Project | 2 Oct. 2024
//Button b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20, b21, b22, b23, b24, b25;
Button[] buttons = new Button[25];
String dVal="0";
String op;
float l, r, result;
boolean left;
void setup() {
  size(210, 250);
  background(127, 127, 255);
  left =true;
  op =  "  ";
  l=0.0;
  r=0.0;
  result = 0.0;
  buttons[0] = new Button(35, 220, 30, 30, "0", 255, true);
  buttons[1] = new Button(35, 185, 30, 30, "1", 255, true);
  buttons[2] = new Button(70, 185, 30, 30, "2", 255, true);
  buttons[3] = new Button(105, 185, 30, 30, "3", 255, true);
  buttons[4] = new Button(35, 150, 30, 30, "4", 255, true);
  buttons[5] = new Button(70, 150, 30, 30, "5", 255, true);
  buttons[6] = new Button(105, 150, 30, 30, "6", 255, true);
  buttons[7] = new Button(35, 115, 30, 30, "7", 255, true);
  buttons[8] = new Button(70, 115, 30, 30, "8", 255, true);
  buttons[9] = new Button(105, 115, 30, 30, "9", 255, true);
  buttons[10] = new Button(140, 185, 30, 30, "+", 127, false);
  buttons[11] = new Button(140, 150, 30, 30, "x", 127, false);
  buttons[12] = new Button(175, 150, 30, 30, "÷", 127, false);
  buttons[13] = new Button(175, 185, 30, 30, "-", 127, false);
  buttons[14] = new Button(105, 80, 30, 30, "x²", 127, false);
  buttons[15] = new Button(140, 80, 30, 30, "Del", 127, false);
  buttons[16] = new Button(35, 80, 30, 30, "√", 127, false);
  buttons[17] = new Button(70, 80, 30, 30, "sin", 127, false);
  buttons[18] = new Button(140, 220, 30, 30, "±", 127, false);
  buttons[19] = new Button(175, 220, 30, 30, "=", 127, false);
  buttons[20] = new Button(175, 115, 30, 30, "Clear", 127, false);
  buttons[21] = new Button(180, 80, 30, 40, "π", 127, false);
  buttons[22] = new Button(140, 115, 30, 30, "tan", 127, false);
  buttons[23] = new Button(70, 220, 30, 30, ".", 127, false);
  buttons[24] = new Button(105, 220, 30, 30, "%", 126, false);
}

void draw() {
  background(127, 127, 255);
  //println("Left: " + l + " Op: " + op + " Right: "+r+" Result: " + result);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(255, 222, 0);
  rect(width/2, 25, 190, 30);
  fill(0);
  if (dVal.length()<21) {
    textSize(13);
  } else if (dVal.length()<23) {
    textSize(12);
  }
  textAlign(RIGHT);
  text(dVal, width-50, 25);
}

void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length()<20) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        l=float(dVal);
      } else {
        dVal += buttons[i].val;
        l = float(dVal);
      }
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length()<20) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      dVal = "0";
      op = "+";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      dVal = "0";
      op = "-";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x")) {
      dVal = "0";
      op = "*";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("÷")) {
      dVal = "0";
      op = "÷";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l=l*0.01;
        dVal=str(l);
      } else {
        r=r*0.01;
        dVal=str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        l=sqrt(l);
        dVal=str(l);
      } else {
        r=sqrt(r);
        dVal=str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x²")) {
      if (left) {
        l=sq(l);
        dVal=str(l);
      } else {
        r=sq(r);
        dVal=str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("Clear")) {
      left = true;
      op = " ";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left) {
        l=l*-1;
        dVal=str(l);
      } else {
        r=r*-1;
        dVal=str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("Del")) {
      if (left) {
        dVal = dVal.substring(0, dVal.length()-1);
        l=float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length()-1);
        r=float(dVal);
      }
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal+=buttons[i].val;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      performCalc();
    }else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        dVal = str(PI);
        l = PI;
      } else {
        dVal = str(PI);
        r = PI;
      }




    //if (buttons[i].on == true) {
    //if (buttons[i].val.equals("C")) {
    // dVal = "0.0";
    //op = ' ';
    //l = 0.0;
    //r = 0.0;
    // result = 0.0;
    // } else if (dVal.equals("0.0")) {
    // dVal = buttons[i].val;
    // } else {
    //if (left == true) {
    // dVal += buttons[i].val;
    //l = float(dVal);
    // }
    // }
    //}
    }
  }
}

void performCalc() {
  if (op == "+") {
    result = l + r;
  } else if (op == "-") {
    result = l - r;
  } else if (op == "*") {
    result = l * r;
  } else if (op == "÷") {
    result = l / r;
  }
  dVal = str(result);
}


void handleEvent( String keyVal, boolean isNum) {
  //handle numbers
  if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (keyVal.equals(".")) {
    if (!dVal.contains(".")&&left) {
      dVal+=".";
      r=float(dVal);
    }
  } else if (keyVal.equals("-")&& isNum) {
    dVal = "0";
    op = "-";
    left = false;
  } else if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("1")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("2")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("3")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("4")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("5")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("6")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("7")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("8")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("9")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (keyVal.equals("+")&& isNum) {
    dVal = "0";
    op = "+";
    left = false;
  } else if (keyVal.equals("=")&& isNum) {
    dVal = "0";
    op = "=";
    left = false;
  } else if (keyVal.equals("/")&& isNum) {
    dVal = "0";
    op = "/";
    left = false;
  } else if (keyVal.equals("-")&& isNum) {
    dVal = "0";
    op = "-";
    left = false;
  }
}

void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 104) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 51 || keyCode ==  99 ) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 52 || keyCode == 100 ) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 53 || keyCode == 101 ) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 54 || keyCode == 102 ) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 55 || keyCode == 103 ) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 56 || keyCode == 104 ) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 57 || keyCode == 105 ) {
    handleEvent("9", true);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", true);
  } else if (key == '.' || keyCode == 110) {
    handleEvent(".", true);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", true);
  }
}
