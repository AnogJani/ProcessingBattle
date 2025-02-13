String[] storage;

int CHALLENGE_SCALE = 400;
int FOOTER_HEIGHT = 200;
int WIDTH = CHALLENGE_SCALE*2; //full width
int HEIGHT = CHALLENGE_SCALE + FOOTER_HEIGHT; //full height
int current_challenge;

boolean difference_view = false;
boolean sliding_view = true;

PImage solution;

void settings () {
  size(WIDTH,HEIGHT);
  load_from_storage();
}

void setup () {
  windowTitle("Processing Battle! ⚔");
  width = CHALLENGE_SCALE;
  height = CHALLENGE_SCALE;
}

void draw () {
  background(#89a8b2);
  
  set_challenge();
  
  //& TODO loadPixels to be compared with the solution
  
  //layout
  noStroke();
  fill(#b3c8cf);
  rect(0,CHALLENGE_SCALE,WIDTH,FOOTER_HEIGHT);
  
  //& TODO add Footer
  // inside maybe add eyedropper, level selector, tutorial, welcome screen, accuracy display, level display etc...
  
  noFill();
  stroke(#d2d5d2);
  strokeWeight(3);
  line(width,0,width,height); //vertical
  line(0,height,WIDTH,height); //horizontal
  
}

void set_challenge () {
  reset_sketch_props();
  
  //challenge dictionary
  if (current_challenge == 0) {Challenge0();} else 
  if (current_challenge == 1) {Challenge1();} else 
  if (current_challenge == 2) {Challenge2();} else {return;}
  solution = loadImage(current_challenge + ".png");
  image(solution,width,0);
  
  //difference view
  if (difference_view) {
    blend(solution,0,0,width,height,0,0,width,height,DIFFERENCE);
  }
  
  //slider
  if (hovering(0,0,width,height) && sliding_view) {
    //sliderImage
    PImage slider = solution.get(constrain(mouseX,0,width),0,constrain(width-mouseX,width,0),height);
    image(slider,mouseX,0);
    //sliderLine
    stroke(255,0,0);
    line(constrain(mouseX,0,width),0,constrain(mouseX,0,width),height);
    //sliderTextBoxDisplay
    rectMode(CENTER);
    fill(255,0,0);
    rect(constrain(mouseX,20,width-20),height-20,40,20,10);
    rectMode(CORNER);
    //sliderTextDisplay
    fill(255);
    textSize(16);
    textAlign(CENTER,CENTER);
    text(mouseX,constrain(mouseX,20,width-20),height-20);
  }
}

void reset_sketch_props () {
  //resets all styles like clear sketch
  fill(255);
  stroke(0);
  strokeWeight(1);
  rectMode(CORNER);
  ellipseMode(CENTER);
  colorMode(RGB,255);
  textAlign(RIGHT,TOP);
}

boolean hovering (float x, float y, float w, float h) {
  return (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
}

void load_from_storage () {
  storage = loadStrings("storage.txt"); //pull data
  current_challenge = int(storage[0]);
}

void push_to_storage () {
  storage[0] = str(current_challenge);
  saveStrings("storage.txt", storage); //push data
}










//-----------FLOOR-BUMP-----------//
