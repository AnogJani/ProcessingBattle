void Solution18 () {
  strokeWeight(10);
  noStroke();
  
  //Background
  fill(#8A0000);
  rect(0,0,width/2,height);
  fill(#C83F12);
  rect(width/2,0,width/2,height);
  
  //Rects
  for (int i = 0 ; i < width ; i += 5) {
    int x = (i*12)%width;
    if (x >= width/2) {fill(#8A0000);} else {fill(#C83F12);}
    rect(x,i,20,20);
  }
  
  //Circle Cutout
  for (int x = 0 ; x < width ; x++) {
    for (int y = 0 ; y < height ; y++) {
      if (dist(x,y,width/2,height/2) > 175) {
        stroke(#3B060A);
        point(x,y);
      }
    }
  }
}
