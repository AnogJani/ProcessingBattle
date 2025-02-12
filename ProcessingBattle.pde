

void settings () {
  size(800,600);
}

void setup () {
  windowTitle("Processing Battle! ⚔");
}

void draw () {
  //layout
  noStroke();
  fill(#89a8b2);
  square(0,0,400);
  square(400,0,400);
  
  fill(#b3c8cf);
  rect(0,400,800,200);
  
  noFill();
  stroke(#d2d5d2);
  strokeWeight(3);
  line(400,0,400,400);
  line(0,400,800,400);
}

















//-----------FLOOR-BUMP-----------//
