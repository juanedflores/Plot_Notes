// 2D Noise

void setup() {
  size(600, 600);
}

void draw() {
  loadPixels();
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++) {
      int index = x + y*width;
      pixels[index] = color(random(0, 255));
    }
  }
  updatePixels();
}
