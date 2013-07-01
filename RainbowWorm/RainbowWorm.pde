/*
* RainbowWorm
* 
* Mantener apretado el mouse y moverlo para generar un gusano multicolor
*/

int diameter = 0;
int wormAge = 0;
int growthRate = 2;

color backgroundColor = #000000;

void setup() {
  size(400, 400);
  
  background(backgroundColor);
  fill(backgroundColor);
  
  // Cambiamos el color a Hue/Saturation/Value en una
  // escala de 0 a 100
  colorMode(HSB, 100);
}

void draw() {
  int hue;
  
  // Si el mouse no está apretado, reiniciamos los contadores
  // y salimos, no hay nada más que hacer
  if (!mousePressed) {
    wormAge = 0;
    diameter = 0;
    return;
  }
  
  // Si el mouse está apretado incrementamos la edad de nuestro "gusano"
  wormAge++;
  
  // Si la edad es un múltiplo de la taza de crecimiento, el "gusano" crece
  if (wormAge % growthRate == 0) {
    diameter++;
  }
  
  // El matiz del color es una función de la edad
  hue = wormAge % 100;
  stroke(hue, 100, 100);
  
  // Pintamos el círculo
  ellipse(mouseX, mouseY, diameter, diameter);
}
