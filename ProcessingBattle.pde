import java.awt.*;
import java.awt.datatransfer.*;

String[] storage;

int CHALLENGE_SCALE = 400;
int FOOTER_HEIGHT = 200;
int WIDTH; //full width
int HEIGHT; //full height
int number_of_challenges_to_display = 20;
int current_challenge;
float current_accuracy;
Challenge[] challenges = new Challenge[number_of_challenges_to_display];
int challenge_selector_page;
int challenge_after_tutorial_completion;
int number_of_tutorial_slides = 4;

boolean click = false;
boolean start_click = false;
boolean load_new_challenge = true; //right at the start load a challenge

boolean sliding_view;
boolean difference_view;
boolean coords_view;
boolean eyedropper_mode;

color eyedropper_color;
color eyedropper_color_temp;
int last_copy = 0;

//generated assets
PImage user_solution;
PImage solution;

//assets
PImage SLIDE; //cursor
PImage EYEDROP; //cursor
PImage PARROW; //cursor
PImage PPOINTER; //cursor
PImage PCOORDS; //cursor
PImage cursor_image;
PImage banner;
PImage checkmark;
PImage next_page;
PImage prev_page;
PImage next_page_disabled;
PImage prev_page_disabled;
PImage submit_button_glow;
PImage eyedropper_icon_black;
PImage eyedropper_icon_white;
PImage tutorial_icon;
PImage copy;
PImage copy_complete;
PImage tutorial_4;
PImage tutorial_3;
PImage tutorial_2;
PImage tutorial_1;

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
  init_game_sizes();
  size(WIDTH,HEIGHT,P2D);
  smooth(4); // counteract the P2D bad graphics which was used just for app icon
  load_from_storage();
  PJOGL.setIcon("favicon.png");
}

void setup () {
  windowTitle("Processing Battle!");
  width = CHALLENGE_SCALE;
  height = CHALLENGE_SCALE;
  load_assets();
  if (current_challenge < 0) {start_tutorial(0);}
}

void draw () {
  background(dark_blue);
  set_cursor(PARROW);
  if (click && current_challenge < 0) {next_tutorial();}
  if (load_new_challenge) {load_challenge();}
  
  display_solutions();
  display_footer();
  //seperator lines
  noFill();
  stroke(dark_grey);
  strokeWeight(6);
  line(width,0,width,height); //vertical
  line(0,height,WIDTH,height); //horizontal
  
  //eyedropper
  if ((!hovering(0,0,width,height) || !sliding_view) && eyedropper_mode) {
    set_cursor(EYEDROP);
    eyedropper_color_temp = get(mouseX, mouseY);
    fill(eyedropper_color_temp);
    stroke(dark_grey);
    strokeWeight(2);
    circle(mouseX+25, mouseY-25,20);
  }
  
  cursor(cursor_image);
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
  if (current_challenge == 5) {Challenge05();} else
  if (current_challenge == 6) {Challenge06();} else
  if (current_challenge == 7) {Challenge07();} else
  if (current_challenge == 8) {Challenge08();} else
  if (current_challenge == 9) {Challenge09();} else
  if (current_challenge == 10) {Challenge10();} else
  if (current_challenge == 11) {Challenge11();} else
  if (current_challenge == 12) {Challenge12();} else
  if (current_challenge == 13) {Challenge13();} else
  if (current_challenge == 14) {Challenge14();} else
  if (current_challenge == 15) {Challenge15();} else
  if (current_challenge == 16) {Challenge16();} else
  if (current_challenge == 17) {Challenge17();} else
  if (current_challenge == 18) {Challenge18();} else
  if (current_challenge == 19) {Challenge19();} else
  {user_solution = null;solution = null;return;}
  reset_sketch_props();
  user_solution = get_users_solution();
  String padder = (str(current_challenge).length() == 1 ? "0" : "");
  String solution_file_name = padder + "" + current_challenge + ".png";
  solution = loadImage(solution_file_name);
  messure_accuracy();
  load_new_challenge = false;
}

void submit_challenge () {
  challenges[current_challenge].completed = true;
  challenges[current_challenge].accuracy = current_accuracy;
  if (current_challenge < challenges.length) {
    current_challenge++;
    load_new_challenge = true;
  }// else {end_screen()} ??? TODO
  push_to_storage();
}

void init_game_sizes () {
  WIDTH = CHALLENGE_SCALE*2;
  HEIGHT = CHALLENGE_SCALE + FOOTER_HEIGHT;
  width = CHALLENGE_SCALE;
  height = CHALLENGE_SCALE;
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

void load_assets() {
  font_light = createFont("Dosis-Light.ttf",64,true);
  font_regular = createFont("Dosis-Regular.ttf",64,true);
  font_medium = createFont("Dosis-Medium.ttf",64,true);
  font_bold = createFont("Dosis-Bold.ttf",64,true);
  
  SLIDE = loadImage("horizontal_move_cursor.png");
  EYEDROP = loadImage("eyedrop_cursor.png");
  PARROW = loadImage("arrow_cursor.png");
  PPOINTER = loadImage("pointer_cursor.png");
  PCOORDS = loadImage("coords_cursor.png");
  
  banner = loadImage("banner.png");
  checkmark = loadImage("checkmark.png");
  next_page = loadImage("next_page.png");
  prev_page = loadImage("prev_page.png");
  next_page_disabled = loadImage("next_page_disabled.png");
  prev_page_disabled = loadImage("prev_page_disabled.png");
  submit_button_glow = loadImage("submit_button_glow.png");
  eyedropper_icon_black = loadImage("eyedropper_icon_black.png");
  eyedropper_icon_white = loadImage("eyedropper_icon_white.png");
  tutorial_icon = loadImage("tutorial_icon.png");
  copy = loadImage("copy.png");
  copy_complete = loadImage("copy_complete.png");
  tutorial_4 = loadImage("tutorial-4.png");
  tutorial_3 = loadImage("tutorial-3.png");
  tutorial_2 = loadImage("tutorial-2.png");
  tutorial_1 = loadImage("tutorial-1.png");
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

void set_cursor(PImage cursor) {
  cursor_image = cursor;
}

float roundTo (float num, int digits) {
  return round(num*(pow(10,digits)))/pow(10,digits);
}

void copy_to_clipboard (String text) {
  StringSelection data = new StringSelection(text);
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
  clipboard.setContents(data, data);
}



//------Storage------//
/*
Storage Layout:
0. current_challenge
1. slide_view
2. difference_view
3. coords_view
4. challenges (each challenge seperated by ";", each attribute seperated by ",")
5. challenge_selector_page
6. eyedropper_color
*/
void load_from_storage () {
  storage = loadStrings("storage.txt"); //pull data
  current_challenge = int(storage[0]);
  sliding_view = boolean(storage[1]);
  difference_view = boolean(storage[2]);
  coords_view = boolean(storage[3]);
  String[] challenges_strings = storage[4].split(";");
  for (int i = 0 ; i < challenges.length ; i++) {
    if (i >= challenges_strings.length) {
      challenges[i] = new Challenge(i,0,false);
    } else {
      challenges[i] = new Challenge(challenges_strings[i]);
    }
  }
  challenge_selector_page = int(storage[5]);
  String[] rgb = storage[6].split(",");
  eyedropper_color = color(int(rgb[0]),int(rgb[1]),int(rgb[2]));
}

void push_to_storage () {
  storage[0] = str(current_challenge);
  storage[1] = str(sliding_view);
  storage[2] = str(difference_view);
  storage[3] = str(coords_view);
  String[] challenges_stringied = new String[challenges.length];
  for (int i = 0 ; i < challenges.length ; i++) {
    challenges_stringied[i] = challenges[i].Stringify();
  }
  storage[4] = join(challenges_stringied,";");
  storage[5] = str(challenge_selector_page);
  storage[6] = red(eyedropper_color)+","+green(eyedropper_color)+","+blue(eyedropper_color);
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
  current_accuracy = roundTo(100*float(correct_pixels_counter)/float(width*height),2); //2 digits of accuracy
}


//------Layout-Functions------//
void display_solutions () {
  if (user_solution == null || solution == null) {return;} //current_challenge does not have a coresponding solution
  reset_sketch_props();
  image(user_solution,0,0);
  image(solution,width,0);
  
  //coordinates view
  color coords_color = #FF0000;
  int coords_font_size = 14;
  textFont(font_medium);
  textSize(coords_font_size);
  if (hovering(width,0,width,height) && !eyedropper_mode && coords_view) {
    String coords = (mouseX-width) + " , " + mouseY;
    float coords_w = textWidth(coords)+20;
    float coords_h = coords_font_size+2;
    float coords_x = constrain(mouseX+15,width,width*2-coords_w-5);
    float coords_y = constrain(mouseY-25,5,height);
    set_cursor(PCOORDS);
    stroke(coords_color);
    line(constrain(mouseX,width,width*2),0,constrain(mouseX,width,width*2),height);
    line(width,constrain(mouseY,0,height),width*2,constrain(mouseY,0,height));
    fill(light_grey);
    stroke(dark_grey);
    strokeWeight(2);
    rect(coords_x, coords_y,coords_w,coords_h,100);
    textAlign(LEFT,TOP);
    fill(black);
    text(coords,coords_x+10, coords_y+1);
  }
  
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
    set_cursor(SLIDE);
  }
}


//------Tutorial------//

void start_tutorial (int challenge_after_completion) {
  challenge_after_tutorial_completion = challenge_after_completion;
  current_challenge = -4;
  load_new_challenge = true;
}

void next_tutorial () {
  if (current_challenge == -1) {
    current_challenge = challenge_after_tutorial_completion;
  } else {
    current_challenge++;
  }
  load_new_challenge = true;
  click = false;
}


//------Inputs------//
void mousePressed () {
  if (mouseButton == LEFT) {
    start_click = true;
  }
  if (mouseButton == RIGHT) {
    eyedropper_mode = false;
  }
}

void mouseDragged () {
  start_click = false;
}

void mouseReleased () {
  if (start_click) {
    if (eyedropper_mode) {
      eyedropper_color = eyedropper_color_temp;
      eyedropper_mode = false;
      push_to_storage();
    } else {
      click = true;
    }
    start_click = false;
  }
}

void keyPressed () {
  if (key == ' ') {println(eyedropper_color);} //debug stuff here
}











//--------------FLOOR--BUMP--------------//
