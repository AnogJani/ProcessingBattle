float r = 64;
float w = 400;

void setup () {
  size(800,800);
}

void draw () {
  background(0);
  rectMode(CENTER);
  
  //ghost
  noFill();
  stroke(127);
  rect(width/2,height/2,w,w);
  
  noStroke();
  fill(127);
  if (hovering(width/2-w/2,height/2-w/2,w,w)) {fill(255,0,0);}
  rect(width/2,height/2,w,w,r);
}

boolean hovering (float x, float y, float w, float h, float r) {
  boolean if_in_sq = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  boolean if_in_r = false;
  return if_in_sq;
}

boolean hovering (float x, float y, float w, float h) {
  return hovering(x,y,w,h,0);
}
