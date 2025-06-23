

Nivel01 nivel01;
int estadoJuego;

PImage spritePersonaje;

public void setup() {

  size(800, 600);
  
  spritePersonaje = loadImage("Personaje.png");
  
  nivel01 = new Nivel01();
  estadoJuego = 1;
  
  
  
}


public void draw() {
  background(0);
  
  
  
  switch(estadoJuego) {
  case MaquinaEstadosJuego.MENU:
    //menu();
    break;

  case MaquinaEstadosJuego.JUGANDO:
    jugando();
    break;

  case MaquinaEstadosJuego.VICTORIA:
    //victoria();
    break;

  case MaquinaEstadosJuego.DERROTA:
    //derrota();
    break;
  }
  
  
}

public void jugando(){
  nivel01.iniciar();
}







public void keyPressed() {

  nivel01.keyPressed();
}


public void keyReleased() {

  nivel01.keyReleased();
}
