

Nivel01 nivel01;



public void setup() {

  size(800, 600);
  nivel01 = new Nivel01();
}


public void draw() {
  background(0);
  nivel01.iniciar();
}



public void keyPressed() {

  nivel01.keyPressed();
}


public void keyReleased() {

  nivel01.keyReleased();
}
