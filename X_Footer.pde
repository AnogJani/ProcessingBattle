void display_footer () {
  
  footer_background();
  if (current_challenge < 0) {
      footer_display_tutorial();
  } else {
    footer_banner();
    footer_view_toggles();
    footer_accuracy_display();
    footer_submit_button();
    footer_tutorial_button();
    footer_challenge_selector();
    footer_eyedropper();
    footer_color_display();
  }
}

void footer_background () {
  noStroke();
  fill(light_blue);
  rect(0,height,WIDTH,FOOTER_HEIGHT);
}

void footer_banner () {
  image(banner, 10,height+10);
}

void footer_view_toggles () {
  float btn_slide_x = 45;
  float btn_difference_x = 110;
  float btn_coords_x = 185;
  float btn_height = height+78;
  float btn_size = 18;
  rectMode(CENTER);
  noStroke();
  textAlign(CENTER, TOP);
  textFont(font_medium);
  textSize(14);
  
  //slide toggle
  if (hovering(btn_slide_x, btn_height,btn_size,btn_size,true)){
    fill(dark_grey);
    set_cursor(PPOINTER);
    if (click) {sliding_view = !sliding_view;push_to_storage();}
  } else {
    fill(light_grey);
  }
  rect(btn_slide_x, btn_height,btn_size,btn_size,btn_size/3);
  fill(black);
  text("Slide",btn_slide_x, btn_height-btn_size*1.5);
  if (sliding_view) {image(checkmark, btn_slide_x-btn_size/2,btn_height-btn_size/2,btn_size,btn_size);}
  
  //difference toggle
  if (hovering(btn_difference_x, btn_height,btn_size,btn_size,true)) {
    fill(dark_grey);
    set_cursor(PPOINTER);
    if (click) {difference_view = !difference_view;push_to_storage();}
  } else {
    fill(light_grey);
  }
  rect(btn_difference_x, btn_height,btn_size,btn_size,btn_size/3);
  fill(black);
  text("Difference",btn_difference_x, btn_height-btn_size*1.5);
  if (difference_view) {image(checkmark, btn_difference_x-btn_size/2,btn_height-btn_size/2,btn_size,btn_size);}
  
  //coords toggle
  if (hovering(btn_coords_x, btn_height,btn_size,btn_size,true)) {
    fill(dark_grey);
    set_cursor(PPOINTER);
    if (click) {coords_view = !coords_view;push_to_storage();}
  } else {
    fill(light_grey);
  }
  rect(btn_coords_x, btn_height,btn_size,btn_size,btn_size/3);
  fill(black);
  text("Coordinates",btn_coords_x, btn_height-btn_size*1.5);
  if (coords_view) {image(checkmark, btn_coords_x-btn_size/2,btn_height-btn_size/2,btn_size,btn_size);}
  
  rectMode(CORNER);
}

void footer_accuracy_display () {
  float x = 123;
  float y = height + 105;
  float meter_w = 175;
  float meter_h = 10;
  //title
  fill(black);
  textAlign(CENTER,CENTER);
  textFont(font_medium);
  textSize(20);
  text("Accuracy: " + current_accuracy + "%",x,y);
  y += 25; //move down
  //innerRect
  float fullness = map(current_accuracy,0,100,0,meter_w);
  noStroke();
  fill(dark_blue);
  rect(x-meter_w/2,y-meter_h/2,fullness,meter_h,meter_h);
  //outerRect
  noFill();
  stroke(black);
  strokeWeight(3);
  rect(x-meter_w/2,y-meter_h/2,meter_w,meter_h,4);
}

void footer_submit_button () {
  float x = 123;
  float y = height + 170;
  float w = 130;
  float h = 36;
  color fill_col = light_grey;
  if (hovering(x,y,w,h,true)) {
    set_cursor(PPOINTER);
    image(submit_button_glow,x-submit_button_glow.width/2,y-submit_button_glow.height/2);
    if (mousePressed) {fill_col = dark_grey;}
    if (click) {submit_challenge();}
  }
  noStroke();
  fill(fill_col);
  rectMode(CENTER);
  rect(x,y,w,h,10);
  rectMode(CORNER);
  //title
  fill(black);
  textAlign(CENTER,CENTER);
  textFont(font_bold);
  textSize(24);
  text("Submit!",x,y);
}

void footer_tutorial_button () {
  float btn_w = tutorial_icon.width;
  float btn_h = tutorial_icon.height;
  float btn_x = 5;
  float btn_y = HEIGHT-btn_h-btn_x;
  if (hovering(btn_x,btn_y,btn_w,btn_h)) {
    set_cursor(PPOINTER);
    noStroke();
    fill(255,127);
    circle(btn_x+btn_w/2,btn_y+btn_h/2,btn_w);
    if (click) {start_tutorial(current_challenge);}
  }
  image(tutorial_icon,5,HEIGHT-btn_h-5);
}

void footer_challenge_selector () {
  float cs_x = 235;
  float cs_y = height+13;
  float cs_w = 422;
  float cs_h = 180;
  
  //background
  stroke(dark_grey);
  strokeWeight(6);
  fill(light_grey);
  rect(cs_x, cs_y, cs_w, cs_h, 7);
  
  //title
  fill(black);
  textAlign(CENTER,CENTER);
  textFont(font_bold);
  textSize(20);
  text("Challenge Selector:",cs_x+cs_w/2,cs_y+17);
  
  //current_challenge display
  textFont(font_medium);
  textSize(14);
  text("Current Challenge: " + current_challenge,cs_x+cs_w/2,cs_y+cs_h-15);
  
  //challenges
  float gap_x = 76;
  float gap_y = 57;
  float start_x = 294;
  float start_y = height+75;
  float x = start_x;
  float y = start_y;
  for (int i = challenge_selector_page*10 ; i < (challenge_selector_page+1)*10 ; i++) {
    if (i >= challenges.length) {break;}
    if (x >= start_x + gap_x*5) {y += gap_y;x = start_x;}
    challenges[i].display(x,y);
    x += gap_x;
  }
  
  //page flippers 
  int a_w = next_page.width;
  int a_h = next_page.height;
  PImage next_page_display = next_page;
  PImage prev_page_display = prev_page;
  if (challenge_selector_page < floor(challenges.length / 10)-1) {
    if (hovering(cs_x+cs_w-a_w-8,cs_y+cs_h-a_h-8,a_w,a_h)) { //next_page
      set_cursor(PPOINTER);
      if (click) {challenge_selector_page++;push_to_storage();}
    }
  } else {
    next_page_display = next_page_disabled;
  }
  if (challenge_selector_page > 0) {
    if (hovering(cs_x+8,cs_y+cs_h-a_h-8,a_w,a_h)) { //prev_page
      set_cursor(PPOINTER);
      if (click) {challenge_selector_page--;push_to_storage();}
    }
  } else {
    prev_page_display = prev_page_disabled;
  }
  image(next_page_display,cs_x+cs_w-a_w-8,cs_y+cs_h-a_h-8);
  image(prev_page_display,cs_x+8,cs_y+cs_h-a_h-8);
}

void footer_eyedropper () {
  float s = 35;
  float x = 729;
  float y = height+13+s/2;
  int brightness = int(brightness(eyedropper_color));
  rectMode(CENTER);
  stroke(dark_grey);
  strokeWeight(6);
  fill(eyedropper_color);
  rect(x, y, s, s, 7);
  rectMode(CORNER);
  if (hovering(x,y,s,s,true)) {
    set_cursor(PPOINTER);
    if (click) {eyedropper_mode = true;}
  }
  if (brightness > 180) {
    image(eyedropper_icon_black,x-s/2,y-s/2);
  } else {
    image(eyedropper_icon_white,x-s/2,y-s/2);
  }
  
}

void footer_color_display () {
  int red = int(red(eyedropper_color));
  int green = int(green(eyedropper_color));
  int blue = int(blue(eyedropper_color));
  int hue = int(hue(eyedropper_color));
  int saturation = int(saturation(eyedropper_color));
  int brightness = int(brightness(eyedropper_color));
  String rgb = "(" + red + "," + green + "," + blue + ")";
  String hsb = "(" + hue + "," + saturation + "," + brightness + ")";
  String hex = "#" + hex(eyedropper_color,6);
  
  float x = 729;
  float y = height+125;
  float w = 120;
  float h = 135;
  //background
  rectMode(CENTER);
  fill(light_grey);
  stroke(dark_grey);
  strokeWeight(6);
  rect(x, y, w, h, 7);
  rectMode(CORNER);
  
  //copy button
  float cb_x = x - w/2 + 5;
  float cb_y = y - h/2 + 5;
  if (last_copy > 0) {
    image(copy_complete,cb_x,cb_y);
    last_copy--;
  } else {
    image(copy,cb_x,cb_y);
  }
  if (hovering(cb_x,cb_y,copy.width,copy.height)) {
    set_cursor(PPOINTER);
    if (click) {copy_to_clipboard(hex);last_copy = 60;}
  }
  
  //lables
  fill(black);
  textAlign(CENTER,TOP);
  textFont(font_bold);
  textSize(15);
  text("RGB:",x,y-16*3-8);
  textFont(font_medium);
  textSize(15);
  text(rgb,x,y-16*2-8);
  textFont(font_bold);
  textSize(15);
  text("HSB:",x,y-16*1);
  textFont(font_medium);
  textSize(15);
  text(hsb,x,y-16*0);
  textFont(font_bold);
  textSize(15);
  text("HEX:",x,y-16*(-1)+8);
  textFont(font_medium);
  textSize(15);
  text(hex,x,y-16*(-2)+8);
}



void footer_display_tutorial () {
  PImage tutorial_image = loadImage("tutorial" + current_challenge + ".png");
  image(tutorial_image,0,height);
}




class Challenge {
  int number;
  float accuracy;
  boolean completed;
  float s = 35;
  
  Challenge (int number_, float accuracy_, boolean completed_) {
    number = number_;
    accuracy = accuracy_;
    completed = completed_;
  }
  
  Challenge (String undecoded) {
    String[] splited = undecoded.split(",");
    number = int(splited[0]);
    accuracy = float(splited[1]);
    completed = boolean(splited[2]);
  }
  
  String Stringify () {
    return (number + "," + accuracy + "," + completed);
  }
  
  void set_accuracy (float new_accuracy) {
    accuracy = new_accuracy;
    completed = true;
  }
  
  void display (float x, float y) {
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    textFont(font_bold);
    strokeWeight(6);
    if (number == current_challenge) {stroke(dark_blue);} else {stroke(dark_grey);}
    if (completed) {fill(light_blue);} else {noFill();}
    if (hovering(x,y,s,s,true)) {
      set_cursor(PPOINTER);
      textSize(28);
      if (click) {current_challenge = number;load_new_challenge = true;push_to_storage();}
    } else {textSize(24);}
    rect(x,y,s,s,7);
    fill(black);
    text(number,x,y);
    rectMode(CORNER);
    if (completed) {
      textAlign(CENTER,TOP);
      textFont(font_regular);
      textSize(11);
      text(accuracy+"%",x,y+s/2+5);
    }
  }
  
}









//--------------FLOOR--BUMP--------------//
