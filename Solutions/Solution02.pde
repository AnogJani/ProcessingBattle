//& TODO
void Solution02 () {
  loadPixels(); // Load the pixel array for direct manipulation
  
  // Loop through every pixel on the canvas
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // Map x from 0-400 to 0-255 for the red channel
      float redValue = map(x, 0, width, 0, 255);
      // Map y from 0-400 to 0-255 for the green channel
      float greenValue = map(y, 0, height, 0, 255);
      
      // Set the color with mapped red and green values, blue stays 0
      color c = color(redValue, greenValue, 0);
      
      // Set the pixel color
      pixels[y * width + x] = c;
    }
  }
  
  updatePixels(); // Apply the changes to the display
}
