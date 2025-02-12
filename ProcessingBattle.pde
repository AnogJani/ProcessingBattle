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
  
  set_challenge(1);
  
  //layout
  fill(#b3c8cf);
  rect(0,CHALLENGE_SCALE,WIDTH,FOOTER_HEIGHT);
  
  noFill();
  stroke(#d2d5d2);
  strokeWeight(3);
  line(width,0,width,height); //vertical
  line(0,height,WIDTH,height); //horizontal
}

void set_challenge (int challenge_num) {
  //resets like clear sketch
  noStroke();
  fill(0);
  stroke(0);
  
  //challenge dictionary
  if (challenge_num == 1) {
    Challenge1();
    Solution1();
  }
}













//-----------FLOOR-BUMP-----------//
