void Solution06 () {
  background(#A4B465);
  fill(#F7CFD8);
  stroke(#E195AB);
  strokeWeight(4);
  int s = width/16;
  for (int i = s ; i < width ; i += s) {
    circle(i,i,s*2);
  }
  noStroke();
  fill(#4B164C);
  circle(width-s,height-s,s);
}
