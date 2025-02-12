int CHALLENGE_SCALE = 400;
int FOOTER_HEIGHT = 200;
int WIDTH = CHALLENGE_SCALE*2; //full width
int HEIGHT = CHALLENGE_SCALE + FOOTER_HEIGHT; //full height

void settings () {
  size(WIDTH,HEIGHT);
}

void setup () {
  windowTitle("Processing Battle! ⚔");
  width = CHALLENGE_SCALE;
  height = CHALLENGE_SCALE;
}

void draw () {
  background(#89a8b2);
  
  set_challenge(0);
  
  //layout
  fill(#b3c8cf);
  rect(0,CHALLENGE_SCALE,WIDTH,FOOTER_HEIGHT);
  
  noFill();
  stroke(#d2d5d2);
  strokeWeight(3);
  line(CHALLENGE_SCALE,0,CHALLENGE_SCALE,CHALLENGE_SCALE); //vertical
  line(0,CHALLENGE_SCALE,WIDTH,CHALLENGE_SCALE); //horizontal
}

void set_challenge (int challenge_num) {
  if (challenge_num == 1) {
    Challenge1();
  }
}















//-----------FLOOR-BUMP-----------//
