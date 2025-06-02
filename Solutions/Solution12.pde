void Solution12 () {
  for (int x = 0 ; x < width ; x++) {
    for (int y = 0 ; y < height ; y++) {
      colorMode(HSB);
      float hue = dist(x,y,width/2,height/2);
      stroke(hue,180,255);
      point(x,y);
    }
  }
}
