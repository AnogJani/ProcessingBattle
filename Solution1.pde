void Solution1 () {
  s.beginDraw();
  s.noStroke();
  s.fill(255); //background color
  s.rect(0,0,width,height);
  reset_sketch_props();
  // -------
  // Solution from Here
  
  s.circle(0,height/2,200);
  
  // To Here
  // -------
  s.endDraw();
}
