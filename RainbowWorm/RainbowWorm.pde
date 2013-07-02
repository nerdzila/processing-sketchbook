/*
* RainbowWorm
* 
* Mantener apretado el mouse y moverlo para generar un gusano multicolor
*/

int wormSize = 0;
int wormAge = 0;

color backgroundColor = #000000;

void setup() {
  size(400, 400);
  
  background(backgroundColor);
  fill(backgroundColor);
  
  // Cambiamos el color a Hue/Saturation/Value en una
  // escala de 0 a 100
  colorMode(HSB, 100);
  
  strokeWeight(4);
}

void draw() {
  stroke(getHue(wormAge), 100, 100);
  
  wormSize = getSize(wormAge);
  
  // Pintamos el círculo
  ellipse(mouseX, mouseY, wormSize, wormSize);
}

void mouseMoved() {
  wormAge++;
  
  if (wormAge > 280) {
    wormAge = 0;
  }
}

int getSize(int wormAge) {
  // f(x) = 0.006x^2 + 0.5x
  float size = wormAge * wormAge;
  size = size * 0.006;
  size += 0.2 * wormAge;
  
  return round(size);
}

int getHue(int wormAge) {
  return (wormAge * 2) % 100;
}
