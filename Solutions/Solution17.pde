void Solution17 () {
  background(#DBDBDB);
  translate(width/2,height/2);
  rotate(-HALF_PI);
  
  noFill();
  strokeWeight(8);
  stroke(#AA60C8);
  
  float r = 50;
  for (int num = 2 ; num < 6 ; num++) {
    //Draw Poligon
    beginShape();
    for (int i = 0 ; i <= num ; i++) {
      float x = r * cos(TWO_PI/num * i);
      float y = r * sin(TWO_PI/num * i);
      vertex(x,y);
    }
    endShape(CLOSE);
    //Draw Circle
    circle(0,0,r*2);
    //Calculate New Radius
    r = r / cos(TWO_PI/((num+1)*2));
  }
}
