String[] storage;

int CHALLENGE_SCALE = 400;
int FOOTER_HEIGHT = 200;
int WIDTH = CHALLENGE_SCALE*2; //full width
int HEIGHT = CHALLENGE_SCALE + FOOTER_HEIGHT; //full height
int number_of_challenges_to_display = 15;
int current_challenge;
float current_accuracy;
Challenge[] challenges = new Challenge[number_of_challenges_to_display];
int challenge_selector_page;

boolean click = false;
boolean load_new_challenge = true;

boolean sliding_view;
boolean difference_view;

//generated assets
PImage user_solution;
PImage solution;

//assets
PImage SLIDE; //cursor
PImage EYEDROP; //cursor
PImage PARROW; //cursor
PImage PPOINTER; //cursor
PImage banner;
PImage checkmark;
PImage next_page;
PImage prev_page;
PImage next_page_disabled;
PImage prev_page_disabled;

PFont font_light;
PFont font_regular;
PFont font_medium;
PFont font_bold;

color dark_blue = #89A8B2;
color light_blue = #B3C8CF;
color light_grey = #D2D5D2;
color dark_grey = #B5BAB5;
color black = #182225;

void settings () {
  size(WIDTH,HEIGHT,P2D);
  smooth(4); // counteract the P2D bad graphics which was used just for app icon
  load_from_storage();
  PJOGL.setIcon("favicon.png");
}

void setup () {
  windowTitle("Processing Battle!");
  width = CHALLENGE_SCALE;
  height = CHALLENGE_SCALE;
  load_images_and_fonts();
}

void draw () {
  background(dark_blue);
  if (mouseX != pmouseX || mouseY != pmouseY) {cursor(PARROW);}
  if (load_new_challenge) {load_challenge();load_new_challenge = false;}
  
  display_solutions();
  
  display_footer();
  
  //seperator lines
  noFill();
  stroke(dark_grey);
  strokeWeight(6);
  line(width,0,width,height); //vertical
  line(0,height,WIDTH,height); //horizontal
  
  click = false; //reseting "click" boolean at the end of draw
}



//------Helpers------//
void load_challenge () {
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
  messure_accuracy();
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

void load_images_and_fonts() {
  font_light = createFont("Dosis-Light.ttf",64,false);
  font_regular = createFont("Dosis-Regular.ttf",64,false);
  font_medium = createFont("Dosis-Medium.ttf",64,false);
  font_bold = createFont("Dosis-Bold.ttf",64,false);
  SLIDE = loadImage("horizontal_move_cursor.png");
  EYEDROP = loadImage("eyedrop_cursor.png");
  PARROW = loadImage("arrow_cursor.png");
  PPOINTER = loadImage("pointer_cursor.png");
  banner = loadImage("banner.png");
  checkmark = loadImage("checkmark.png");
  next_page = loadImage("next_page.png");
  prev_page = loadImage("prev_page.png");
  next_page_disabled = loadImage("next_page_disabled.png");
  prev_page_disabled = loadImage("prev_page_disabled.png");
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

boolean hovering (float x, float y, float w, float h, boolean center_mode) {
  if (center_mode) {
    return (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2);
  } else {
    return (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  }
}
boolean hovering (float x, float y, float w, float h) {
  return hovering(x,y,w,h,false);
}


//------Storage------//
/*
Storage Layout:
0. current_challenge
1. slide_view
2. difference_view
3. challenges (each challenge seperated by ";", each attribute seperated by ",")
4. challenge_selector_page
*/
void load_from_storage () {
  storage = loadStrings("storage.txt"); //pull data
  current_challenge = int(storage[0]);
  sliding_view = boolean(storage[1]);
  difference_view = boolean(storage[2]);
  String[] challenges_strings = storage[3].split(";");
  for (int i = 0 ; i < challenges.length ; i++) {
    if (i >= challenges_strings.length) {
      challenges[i] = new Challenge(i,0,false);
    } else {
      challenges[i] = new Challenge(challenges_strings[i]);
    }
  }
  challenge_selector_page = int(storage[4]);
}

void push_to_storage () {
  storage[0] = str(current_challenge);
  storage[1] = str(sliding_view);
  storage[2] = str(difference_view);
  String[] challenges_stringied = new String[challenges.length];
  for (int i = 0 ; i < challenges.length ; i++) {
    challenges_stringied[i] = challenges[i].Stringify();
  }
  storage[3] = join(challenges_stringied,";");
  storage[4] = str(challenge_selector_page);
  saveStrings("storage.txt", storage); //push data
}


//------Accuracy------//
void messure_accuracy () {
  if (user_solution == null || solution == null) {current_accuracy=0;return;}
  int correct_pixels_counter = 0;
  user_solution.loadPixels();
  solution.loadPixels();
  for (int i = 0 ; i < width*height ; i++) {
    if (solution.pixels[i] == user_solution.pixels[i]) {
      correct_pixels_counter++;
    }
  }
  current_accuracy = 100*float(correct_pixels_counter)/float(width*height);
}


//------Layout-Functions------//
void display_solutions () {
  if (user_solution == null || solution == null) {return;} //current_challenge does not have a coresponding solution
  reset_sketch_props();
  image(user_solution,0,0);
  image(solution,width,0);
  
  //difference view
  if (difference_view) {
    blend(solution,0,0,width,height,0,0,width,height,DIFFERENCE);
  }
  
  //slider
  color slider_color = #FF0000;
  if (hovering(0,0,width,height) && sliding_view) {
    //sliderImage
    PImage slider = solution.get(constrain(mouseX,0,width),0,constrain(width-mouseX,width,0),height);
    image(slider,mouseX,0);
    //sliderLine
    stroke(slider_color);
    line(constrain(mouseX,0,width),0,constrain(mouseX,0,width),height);
    //sliderTextBoxDisplay
    rectMode(CENTER);
    fill(slider_color);
    rect(constrain(mouseX,25,width-25),height-20,40,20,10);
    rectMode(CORNER);
    //sliderTextDisplay
    fill(255);
    textSize(16);
    textAlign(CENTER,CENTER);
    text(mouseX,constrain(mouseX,25,width-25),height-20);
    cursor(SLIDE);
  }
}

void mouseClicked () {
  click = true;
}













//--------------FLOOR--BUMP--------------//
