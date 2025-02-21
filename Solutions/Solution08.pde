void Solution08 () {
  background(#C9E6F0);
  translate(width/2,height/2);
  //line
  stroke(#355F2E);
  strokeWeight(8);
  line(0,0,0,height/2);
  //circle
  noStroke();
  fill(#F4E0AF);
  circle(0,0,100);
  //circles
  noStroke();
  fill(#FFCCE1);
  for (float a = 0 ; a < TWO_PI ; a += PI/4) {
    float x = 75 * cos(a);
    float y = 75 * sin(a);
    circle(x,y,50);
  }
}
