void Solution08 () {
  background(#4B4376);
  noStroke();
  
  //Sun
  fill(#AE445A);
  circle(width/2,height/2,150);
  
  //Mountain
  fill(#432E54);
  triangle(width/2,height/2,width,height,0,height);
  
  //Snow
  fill(255);
  triangle(width/2,height/2,width-175,height-175,0+175,height-175);
  
  //Clouds
  fill(255,127);
  rect(40,60,150,30,100);
  rect(230,130,150,30,100);
}
