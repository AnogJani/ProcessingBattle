void Solution14 () {
  int counter = 0;
  noStroke();
  for (int i = 0 ; i < width ; i += 50) {
    for (int j = 0 ; j < height ; j += 50) {
      if (counter % 2 == 0) {
        fill(#5A6C57);
      } else {
        fill(#D3F1DF);
      }
      square(i,j,50);
      counter++;
    }
    counter++;
  }
}
