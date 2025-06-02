void Solution11 () {
  for (int x = 0 ; x < width ; x++) {
    for (int y = 0 ; y < height ; y++) {
      float r = map(x,0,width,0,255);
      float g = map(y,0,height,0,255);
      stroke(r,g,0);
      point(x,y);
    }
  }
}
