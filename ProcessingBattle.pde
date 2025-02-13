String[] storage;

int CHALLENGE_SCALE = 400;
int FOOTER_HEIGHT = 200;
int WIDTH = CHALLENGE_SCALE*2; //full width
int HEIGHT = CHALLENGE_SCALE + FOOTER_HEIGHT; //full height
int current_challenge;

float accuracy;

boolean difference_view = false;
boolean sliding_view = true;

PImage solution;
PImage user_solution;

PFont font_light;
PFont font_regular;
PFont font_bold;

void settings () {
  size(WIDTH,HEIGHT,P2D);
  smooth(8); // counteract the P2D bad graphics which was used just for app icon
  load_from_storage();
  PJOGL.setIcon("favicon.png");
}

void setup () {
  windowTitle("Processing Battle!");
  width = CHALLENGE_SCALE;
  height = CHALLENGE_SCALE;
  set_challenge();
  messure_accuracy();
  font_light = createFont("Dosis-Light.ttf",64,true);
  font_regular = createFont("Dosis-Regular.ttf",64,true);
  font_bold = createFont("Dosis-Bold.ttf",64,true);
  textFont(font_bold);
}

void draw () {
  background(#89a8b2);
  
  display_solutions();
  
  display_footer();
  
  //seperator lines
  noFill();
  stroke(#d2d5d2);
  strokeWeight(6);
  line(width,0,width,height); //vertical
  line(0,height,WIDTH,height); //horizontal
}



//------Helpers------//
void set_challenge () {
  //challenge dictionary
  reset_sketch_props();
  if (current_challenge == 0) {Challenge00();} else 
  if (current_challenge == 1) {Challenge01();} else 
  if (current_challenge == 2) {Challenge02();} else
  if (current_challenge == 3) {Challenge03();} else
  if (current_challenge == 4) {Challenge04();} else
  {return;}
  reset_sketch_props();
  user_solution = get_users_solution();
  String padder = (str(current_challenge).length() == 1 ? "0" : "");
  String solution_file_name = padder + "" + current_challenge + ".png";
  solution = loadImage(solution_file_name);
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

PImage get_users_solution () {
  //getting the users solution
  PImage full_screen_copy = new PImage(WIDTH,HEIGHT);
  PImage users_screen_copy = new PImage(width,height);
  loadPixels();
  for (int i = 0; i < full_screen_copy.pixels.length; i++) {
    full_screen_copy.pixels[i] = pixels[i];
  }
  full_screen_copy.updatePixels();
  users_screen_copy = full_screen_copy.get(0,0,width,height);
  return users_screen_copy;
}

boolean hovering (float x, float y, float w, float h) {
  return (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
}


//------Storage------//
void load_from_storage () {
  storage = loadStrings("storage.txt"); //pull data
  current_challenge = int(storage[0]);
}

void push_to_storage () {
  storage[0] = str(current_challenge);
  saveStrings("storage.txt", storage); //push data
}


//------Accuracy------//
void messure_accuracy () {
  int correct_pixels_counter = 0;
  solution.loadPixels();
  user_solution.loadPixels();
  for (int i = 0 ; i < width*height ; i++) {
    if (solution.pixels[i] == user_solution.pixels[i]) {
      correct_pixels_counter++;
    }
  }
  accuracy = 100*float(correct_pixels_counter)/float(width*height);
}


//------Layout-Functions------//
void display_solutions () {
  reset_sketch_props();
  image(user_solution,0,0);
  image(solution,width,0);
  
  //difference view
  if (difference_view) {
    blend(solution,0,0,width,height,0,0,width,height,DIFFERENCE);
  }
  
  //slider
  //& TODO: add slider cursor
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
    rect(constrain(mouseX,25,width-25),height-20,40,20,10);
    rectMode(CORNER);
    //sliderTextDisplay
    fill(255);
    textSize(16);
    textAlign(CENTER,CENTER);
    text(mouseX,constrain(mouseX,25,width-25),height-20);
  }
}












//--------------FLOOR--BUMP--------------//
