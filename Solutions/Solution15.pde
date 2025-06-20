// https://youtu.be/XZpegEDixfE?si=u4IVJUyQm81r_zyn

void Solution15 () {
  noStroke();
  boolean[][] cells = new boolean[20][20];
  
  for (int i = 0 ; i < 20*20 ; i++) {
    int x = i % 20;
    int y = floor(i / 20);
    int counter = 0;
    if (x > 0) {counter += int(cells[x-1][y]);}
    if (y > 0) {counter += int(cells[x][y-1]);}
    cells[x][y] = boolean(counter%2);
    
    if (x == 0 && y == 0) {cells[x][y] = true;} //The Starting Square needs to be "active"
    
    //Drawing Squares
    if (cells[x][y]) {fill(#332D56);} else {fill(#4E6688);}
    square(x*20,y*20,20);
  }
}
