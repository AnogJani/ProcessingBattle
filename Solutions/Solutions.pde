int CHALLENGE_SCALE = 400;
String name;

void settings () {
  size(CHALLENGE_SCALE,CHALLENGE_SCALE,P2D);
  smooth(4);
}

void setup () {
  windowTitle("Processing Battle Solution Creator!!!");
  println("Press the space-bar to take a screenshot");
}

void draw () {
  //just replace to the solution you want to display
  name = "18";
  Solution18();
}

void keyPressed() {
  if (key == ' ') {save("../data/" + name + ".png");}
}
