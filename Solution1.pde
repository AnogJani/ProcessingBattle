void Solution1 () {
  push();
  translate(CHALLENGE_SCALE,0);
  noStroke();
  fill(255); //background color
  rect(0,0,width,height);
  reset_sketch_props();
  // -------
  // Solution from Here
  
  circle(0,height/2,200);
  
  // To Here
  // -------
  pop();
}
