
int x = 0;
int y = 0;
int x_speed = 1;
int y_speed = 1;
void Challenge1 () {
  background(255);
  fill(255,0,0);
  circle(width/2+x,height/2+y,200);
  
  x += x_speed;
  y += y_speed;
}
