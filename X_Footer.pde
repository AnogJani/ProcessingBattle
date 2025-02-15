void display_footer () {
  //& TODO: add
  //eyedropper
  //color display
  //level selector + accuracy and level display
  //tutorial + tutorial icon
  //welcome screen
  //accuracy display
  //view togglers
  
  footer_background();
  footer_view_toggles();
  
}

void footer_background () {
  noStroke();
  fill(light_blue);
  rect(0,height,WIDTH,FOOTER_HEIGHT);
  image(banner, 10,height+10);
}

void footer_view_toggles () {
  float btn_slide_x = 32;
  float btn_difference_x = 125;
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
    if (click) {sliding_view = !sliding_view;}
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
    if (click) {difference_view = !difference_view;}
  } else {
    fill(light_grey);
  }
  rect(btn_difference_x, height+btn_height,btn_size,btn_size,btn_size/3);
  fill(black);
  text("Difference View",btn_difference_x+btn_size/1.5, height+btn_height);
  if (difference_view) {image(checkmark, btn_difference_x-btn_size/2,height+btn_height-btn_size/2,btn_size,btn_size);}
  
  rectMode(CORNER);
}
