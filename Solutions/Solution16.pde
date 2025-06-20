void Solution16 () {
  background(#90c9f5);
  
  //Ground
  noStroke();
  fill(#64bf5a);
  rect(0,300,width,100);
  
  //Tree
  translate(width/2, height);
  rotate(PI);
  stroke(#70411c);
  branch(6,200);
}

void branch(int depth, int len) {
  if (depth == 0) {return;}
  float stick_angle = PI/4;
  strokeWeight(depth*2);
  line(0,0,0,len);
  push();
    translate(0,len);
    rotate(stick_angle);
    branch(depth-1,len/2); //first branch
    rotate(-stick_angle*2);
    branch(depth-1,len/2); //second branch
  pop();
}
