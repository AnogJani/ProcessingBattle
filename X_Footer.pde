void display_footer () {
  //& TODO: add
  //eyedropper
  //color display
  //challenge selector + challenge & accuracy display
  //tutorial + tutorial icon
  //welcome screen
  //accuracy display
  //view togglers
  
  footer_background();
  footer_view_toggles();
  
  footer_challenge_selector();
  
}

void footer_background () {
  noStroke();
  fill(light_blue);
  rect(0,height,WIDTH,FOOTER_HEIGHT);
  image(banner, 10,height+10);
}

void footer_view_toggles () {
  float btn_slide_x = 27;
  float btn_difference_x = 120;
  float btn_height = 65;
  float btn_size = 18;
  rectMode(CENTER);
  noStroke();
  textAlign(LEFT, CENTER);
  textFont(font_medium);
  textSize(14);
  
  //slide toggle
  if (hovering(btn_slide_x, height+btn_height,btn_size,btn_size,true)){
    fill(dark_grey);
    cursor(PPOINTER);
    if (click) {sliding_view = !sliding_view;push_to_storage();}
  } else {
    fill(light_grey);
  }
  rect(btn_slide_x, height+btn_height,btn_size,btn_size,btn_size/3);
  fill(black);
  text("Slide View",btn_slide_x+btn_size/1.5, height+btn_height);
  if (sliding_view) {image(checkmark, btn_slide_x-btn_size/2,height+btn_height-btn_size/2,btn_size,btn_size);}
  
  //difference toggle
  if (hovering(btn_difference_x, height+btn_height,btn_size,btn_size,true)) {
    fill(dark_grey);
    cursor(PPOINTER);
    if (click) {difference_view = !difference_view;push_to_storage();}
  } else {
    fill(light_grey);
  }
  rect(btn_difference_x, height+btn_height,btn_size,btn_size,btn_size/3);
  fill(black);
  text("Difference View",btn_difference_x+btn_size/1.5, height+btn_height);
  if (difference_view) {image(checkmark, btn_difference_x-btn_size/2,height+btn_height-btn_size/2,btn_size,btn_size);}
  
  rectMode(CORNER);
}

void footer_challenge_selector () {
  float cs_x = 235;
  float cs_y = height+13;
  float cs_w = 422;
  float cs_h = 170;
  
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
  for (int i = challenge_selector_page*10 ; i < challenge_selector_page+1*10 ; i++) {
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
  if (challenge_selector_page < floor(challenges.length / 10)) {
    if (hovering(cs_x+cs_w-a_w-8,cs_y+cs_h-a_h-8,a_w,a_h)) { //next_page
      cursor(PPOINTER);
      if (click) {challenge_selector_page++;push_to_storage();}
    }
  } else {
    next_page_display = next_page_disabled;
  }
  if (challenge_selector_page > 0) {
    if (hovering(cs_x+8,cs_y+cs_h-a_h-8,a_w,a_h)) { //prev_page
      cursor(PPOINTER);
      if (click) {challenge_selector_page--;push_to_storage();}
    }
  } else {
    prev_page_display = prev_page_disabled;
  }
  image(next_page_display,cs_x+cs_w-a_w-8,cs_y+cs_h-a_h-8);
  image(prev_page_display,cs_x+8,cs_y+cs_h-a_h-8);
}





class Challenge {
  int number;
  float accuracy;
  boolean completed;
  
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
    float s = 35;
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    textFont(font_bold);
    strokeWeight(6);
    if (number == current_challenge) {stroke(dark_blue);} else {stroke(dark_grey);}
    if (completed) {fill(light_blue);} else {noFill();}
    if (hovering(x,y,s,s,true)) {cursor(PPOINTER);textSize(28);} else {textSize(24);}
    rect(x,y,s,s,7);
    fill(black);
    text(number,x,y);
    rectMode(CORNER);
  }
  
}









//--------------FLOOR--BUMP--------------//
