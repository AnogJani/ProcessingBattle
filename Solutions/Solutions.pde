int CHALLENGE_SCALE = 400;

void settings () {
  size(CHALLENGE_SCALE,CHALLENGE_SCALE);
}

void setup () {
  windowTitle("Processing Battle Solution Creator!!! ⚔");
  println("Press the space-bar to take a screenshot");
}

void draw () {
  //just replace to the solution you want to display
  Solution01();
}

void keyPressed() {
  if (key == ' ') {save("solution.png");}
}
