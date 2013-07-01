int diameter = 0;
int step = 0;
int period = 2;

void setup() {
  size(400, 400);
  
  background(#000000);
  fill(#000000);
  
  colorMode(HSB, 100);
}

void draw() {
  if (mousePressed) {
    step++;
    if (step >= period) {
      diameter ++;
      step = 0;
    }
  } else {
    diameter = 0;
    step = 0;
  }
  
  int hue = diameter % 100; 
  
  stroke(hue, 100, 100);
  
  ellipse(mouseX, mouseY, diameter, diameter);
}
