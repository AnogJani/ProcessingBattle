import processing.sound.*;

SoundFile sound;

void setup() {
  size(400, 200);
  
  // Load the sound file (make sure the file is in the 'data' folder of your sketch)
  sound = new SoundFile(this, "mouseOver.wav");
}

void draw() {
  background(200);
  textAlign(CENTER, CENTER);
  text("Click to play sound", width / 2, height / 2);
}

void mousePressed() {
  // Play the sound when the mouse is pressed
  sound.stop();
  if (!sound.isPlaying()) {
    sound.play();
  }
}
