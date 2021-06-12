/*
 * Make random noise using cross hatching
 * juanedflores
 */

import processing.svg.*;

int pixelsize = 50;

void setup() {
  size(1200, 600);
  noLoop();
  beginRecord(SVG, "line_noise.svg");
}

void draw() {
  background(255);

  for(int x=0; x<width; x+=pixelsize) {
    for(int y=0; y<height; y+=pixelsize) {
      int randomValue= floor(random(2, pixelsize/5));
      for (int x2=x; x2<x+pixelsize; x2+=randomValue) {
        line(x2,y,x2,y+pixelsize);
      }
      for (int y2=y; y2<y+pixelsize; y2+=randomValue) {
        line(x,y2,x+pixelsize,y2);
      }
    }
  }
  endRecord();
}
