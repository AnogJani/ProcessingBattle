void Solution09 () {
  background(#F8E7F6);
  noStroke();
  
  //Ears
  fill(#FFD586);
  triangle(50,height/2,350,height/2,350,50);
  triangle(50,height/2,350,height/2,50,50);
  
  //Head
  fill(#FFC785);
  ellipse(width/2,height/2,300,200);
  
  //Eyes
  fill(255);
  ellipse(150,height/2,70,50);
  ellipse(250,height/2,70,50);
  fill(#DDEB9D);
  ellipse(150,height/2,50,50);
  ellipse(250,height/2,50,50);
  fill(0);
  ellipse(150,height/2,20,50);
  ellipse(250,height/2,20,50);
  
  //Nose
  fill(#FF9898);
  ellipse(width/2,250,50,20);
}
