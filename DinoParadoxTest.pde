
Nivel01 nivel01;
Nivel02 nivel02;
int estadoJuego;

PImage spritePersonaje;

public void setup() {

  size(800, 600);
  
  spritePersonaje = loadImage("Personaje.png");
  
  println("Elimina 10 dinosaurios");
  nivel01 = new Nivel01();
  nivel02 = new Nivel02();
  estadoJuego = 0;
  
  
  
}


public void draw() {
  background(0);
  
  
  
  switch(estadoJuego) {
  case MaquinaEstadosJuego.MENU:
  
   fill(#132B50);
   textSize(44);
   textAlign(CENTER);
   text("Presiona cualquier tecla", width/2, height/2);
   
   textSize(20);
   text("Antes maximizar Processing para ver los mensajes en consola", width/2, height-200);
   
    //menu();
    break;

  case MaquinaEstadosJuego.JUGANDO_NIVEL01:
    jugando01(); //cambiar a jugando02 para el siguiente nivel
    break;
    
  case MaquinaEstadosJuego.JUGANDO_NIVEL02:
    
    jugando02(); //cambiar a jugando02 para el siguiente nivel
    break;  

  case MaquinaEstadosJuego.VICTORIA:
  
   fill(#132B50);
   textSize(44);
   textAlign(CENTER);
   text("GANASTE EL JUEGO", width/2, height/2);
   
    //victoria();
    break;

  case MaquinaEstadosJuego.DERROTA:
    //derrota();
    break;
  }
  
  
}

public void jugando01(){
  nivel01.iniciar();
}

public void jugando02(){
  nivel02.iniciar();
}





public void keyPressed() {
  
  if(estadoJuego == 0){
    estadoJuego = 3;
  }

  nivel01.keyPressed();
  nivel02.keyPressed();
}


public void keyReleased() {

  nivel01.keyReleased();
  nivel02.keyReleased();
}
