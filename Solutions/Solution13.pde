void Solution13 () {
  background(#B2CD9C);
  fill(#CA7842);
  stroke(#4B352A);
  strokeWeight(2);
  for (float x = 0 ; x < width ; x++) {
    float y = sin(x / 20) * 100 + height/2;
    circle(x,y,20);
  }
}
