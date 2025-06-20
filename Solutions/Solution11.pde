void Solution11 () {
  background(#872341);
  fill(#BE3144);
  strokeWeight(4);
  stroke(#E17564);
  for (int i = 0 ; i < 10 ; i++) {
    arc(width/2, height/2, 300-i*30, 300-i*30, 0, map(i,0,10,TWO_PI,0),PIE);
  }
}
