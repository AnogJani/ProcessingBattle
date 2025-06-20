void Solution19 () {
  background(#FFF2E0);
  noStroke();
  fill(#C0C9EE);
  for (int i = 10 ; i < width ; i += 20) {
    for (int j = 10 ; j < height ; j += 20) {
      float d = map(sin(dist(i,j,0,0)*0.05),1,-1,0,20);
      circle(i,j,d);
    }
  }
}
