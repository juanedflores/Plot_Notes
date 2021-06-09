import processing.svg.*;

float circle_posoffset = 40;
float circle_size;

float pi = 0.0;

float phase;

int frame = 0;

void setup() {
  size(1600, 400);

  noLoop();
  textAlign(CENTER, CENTER);
  beginRecord(SVG, "wave.svg");

  circle_size = (width/11)-circle_posoffset;
}

void draw_pi_circles(float h, int row_size) {

  // Draw something
  for (int x=0; x<width-circle_size; x+=width/row_size) {
    if (x>0) {
      // draw circle
      noFill();
      strokeWeight(1);
      ellipse(x, h, circle_size, circle_size);
      // draw quadrants
      // line(x, (h-circle_size/2)-5, x, (h+circle_size/2)+5);
      // line((x-circle_size/2)-5, h, (x+circle_size/2)+5, h);
      // draw line angle
      strokeWeight(2);
      fill(0);
      line(x, h, x+(cos(pi*PI)*circle_size/2), h-(sin(pi*PI)*circle_size/2));
      ellipse(x+(cos(pi*PI)*circle_size/2), h-(sin(pi*PI)*circle_size/2), 6, 6);

      // draw text
      // String pi_f = nf(pi, 0, 1);
      // text(pi_f+"PI", x-10, h + (circle_size/2) + 30);
      // println("pi: " + pi_f);

      pi+=0.1;
    }
  }

}

void draw_sine_wave(float h, float div1) {
  // draw sine wave
  float range =  10*(width/div1);
  strokeWeight(1);
  for (float x=0; x<range+100; x++) {
    point(x+(width/div1), h-sin(PI*(x/range))*circle_size/2);
  }
}

void draw() {
  background(255);

  draw_pi_circles(height*(1.0/3.0)-30, 12);
  draw_pi_circles(height*(2.0/3.0), 11);

  draw_sine_wave(height*(1.0/3.0)-30, 12);

  println("done");
  endRecord();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      phase+=5;
    } 
    else if (keyCode == RIGHT) {
      phase-=5;
    } 
  }
}
