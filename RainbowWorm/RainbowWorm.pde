/*
* RainbowWorm
* 
* Mantener apretado el mouse y moverlo para generar un gusano multicolor
*/

int wormSize = 0;
int wormAge = 0;
float growthRate = 0.7;

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
  int hue;
  
  // Si el mouse no está apretado, reiniciamos los contadores
  // y salimos, no hay nada más que hacer
  if (!mousePressed) {
    wormAge = 0;
    wormSize = 0;
    return;
  }
  
  // Si el mouse está apretado incrementamos la edad de nuestro "gusano"
  ++wormAge;
  
  wormSize = getSize(wormAge);
  
  // El matiz del color es una función de la edad
  hue = wormAge % 100;
  stroke(hue, 100, 100);
  
  // Pintamos el círculo
  ellipse(mouseX, mouseY, wormSize, wormSize);
}

int getSize(int wormAge) {
  float size = wormAge * growthRate;
  
  if (size > 100) {
    size += (size - 100) * (size - 100);
  }
  
  return round(size);
}
