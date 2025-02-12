int CHALLENGE_SCALE = 400;
int FOOTER_HEIGHT = 200;
int WIDTH = CHALLENGE_SCALE*2; //full width
int HEIGHT = CHALLENGE_SCALE + FOOTER_HEIGHT; //full height
int current_challenge = 1;

PGraphics s; // solution

void settings () {
  size(WIDTH,HEIGHT);
}

void setup () {
  windowTitle("Processing Battle! ⚔");
  width = CHALLENGE_SCALE;
  height = CHALLENGE_SCALE;
  s = createGraphics(width, height);
}

void draw () {
  background(#89a8b2);
  
  set_challenge();
  
  //layout
  noStroke();
  fill(#b3c8cf);
  rect(0,CHALLENGE_SCALE,WIDTH,FOOTER_HEIGHT);
  
  noFill();
  stroke(#d2d5d2);
  strokeWeight(3);
  line(width,0,width,height); //vertical
  line(0,height,WIDTH,height); //horizontal
}

void set_challenge () {
  reset_sketch_props();
  
  //challenge dictionary
  if (current_challenge == 1) {
    Challenge1();
    Solution1();
  }
  image(s,width,0);
}

void reset_sketch_props () {
  //resets all styles like clear sketch
  fill(255);
  stroke(0);
  strokeWeight(1);
  s.fill(255);
  s.stroke(0);
  //s.strokeWeight(1);
}











//-----------FLOOR-BUMP-----------//
